% Input the User ID
while 1
    userID = input("Insert User ID (1 to ??):");

    % Only breaks if valid 
    if userID >= 1 && userID <= length(users)
        break;
    end
end

while 1
    option = input("1 - Restaurants evaluated by you\n" + ...
        "2 - Set of restaurants evaluated by the most similar user\n" + ...
        "3 - Search special dish\n" + ...
        "4 - Find most similar restaurants\n" + ...
        "5 - Estimate the number of evaluations for each tourist\n" + ...
        "6 - Exit\n" + ...
        "Select choice:");

    switch option
        case 1
            fprintf("-----------Evaluated Restaurants-----------\n");
            printEvaluatedRestaurants(userID, Set, rest);
            fprintf("------------------------------------------\n");
        case 2
            similarUserID = findSimilar(userID, userSignatures, Set);
            fprintf("-----------Evaluated Restaurants By Similar-----------\n");
            printEvaluatedRestaurants(similarUserID, Set, rest);
            fprintf("------------------------------------------------------\n");
        case 3
            dishInput = lower(input("Write a dish:", "s"));
            searchSimilarDishes(dishInput, rest, hashFuns, dishesSignatures)
        case 4
            printEvaluatedRestaurants(userID, Set, rest)
            while 1
                restaurantID = input("\nChoose a restaurant by ID:");
                evaluatedRestaurants = Set{userID};
                if any(evaluatedRestaurants == restaurantID)
                    break
                else
                    fprintf("RestaurantID Not Found\n");
                end
            end
            searchSimilarRestaurants(restaurantID, rest, restSignatures, u);

        case 5
            while 1
                newUserID = input("Insert Another User ID:");
                % Only breaks if valid 
                if newUserID >= 1 && newUserID <= length(users) && newUserID ~= userID
                    break;
                end
            end
            nRatings = calcNumberOfRatings(newUserID, B, hashFunsBloom);
            fprintf("UserID: %d ESTIMATE RATINGS NUMBER: %d\n", newUserID, nRatings);
        case 6
            break
        otherwise
            fprintf("Invalid Option\n");
    end
end

function printEvaluatedRestaurants(userID, Set, rest)
    evaluatedRestaurants = unique(Set{userID});
    
    for i=1:length(evaluatedRestaurants)
        restaurantID = evaluatedRestaurants(i);
        restaurantNAME = rest{restaurantID, 2};
        restaurantCONCELHO = rest{restaurantID, 4};
        fprintf("ID:%3d NAME:%s DISTRICT:%s\n", restaurantID, restaurantNAME, restaurantCONCELHO);
    end
end

function similarUserID = findSimilar(userID, signatures, Set)
    distances = zeros(1,length(Set));
    for u=1:length(Set)
        if u~=userID
            c1 = signatures(:, u);
            c2 = signatures(:, userID);

            distances(u)= 1 - sum(c1 == c2)/height(signatures);
        else
            distances(u) = Inf; %ignores the distance between himself
        end
    end
    [~,similarUserID] = min(distances);
end

function searchSimilarDishes(string, rest, hashFuns, dishesSignatures) 
    string = strrep(string, ' ', '');
    % Creating signatures for inputed string
    shingleSize = 5;%ATENÇÃO: Valor tem de ser igual ao da função minHashDish 
    k = 200; %ATENÇÃO: Valor tem de ser igual ao da função minHashDish
    shingles = {};
    if length(string) < shingleSize
        shingles{1} = string;
    else
        for i=1:length(string)-shingleSize+1
            shingles{i} = [string(i:i+shingleSize-1) ' '];
        end
    end
    shingles = [shingles{:}];

    stringSignature = zeros(k, 1);
    for j=1:k
        stringSignature(j, 1) = carterMinHashFunction(hashFuns, j, shingles); 
    end

    % Find similars
    Nres = height(rest);
    distances = zeros(1, Nres);
    for restaurantID=1:Nres
        if ~any(dishesSignatures(:, restaurantID) == -1)
            c1 = stringSignature(:, 1);
            c2 = dishesSignatures(:, restaurantID);

            distances(restaurantID)= 1 - sum(c1 == c2)/k;
        else
            distances(restaurantID) = Inf; %Distance from missing dish ignored
        end
    end

    [sortedDistances, sortedIndices] = sort(distances);
    similarRestaurants = [];

    for i = 1:min(5, sum(sortedDistances <= 0.99))
        similarRestaurants = [similarRestaurants, sortedIndices(i)];
    end

    % Display the result
    if isempty(similarRestaurants)
        fprintf('Restaurant NOT FOUND\n');
    else
        for i=1:length(similarRestaurants)
            restaurantID = similarRestaurants(i);
            restaurantNAME = rest{restaurantID, 2};
            restaurantLOCAL = rest{restaurantID, 3};
            restaurantDISH = rest{restaurantID, 6};
            distance = distances(restaurantID);
            fprintf("NAME: %s LOCAL: %s DISH: %s JACCARD_DISTANCE:%.2f\n", restaurantNAME, restaurantLOCAL, restaurantDISH, distance);
        end
    end
end



function searchSimilarRestaurants(restaurantID, rest, restSignatures, u)
    Nres = width(restSignatures);
    distances = zeros(1, Nres);
    for restID = 1:Nres
        % Skip comparing the input restaurant with itself
        if restID == restaurantID
            distances(restID) = Inf;
            continue;
        end

        c1 = restSignatures(:, restaurantID);
        c2 = restSignatures(:, restID);

        distances(restID) = 1 - sum(c1 == c2) / height(restSignatures);
    end

    % Sort distances and find three most similar restaurants
    [sortedDistances, sortedIndices] = sort(distances);
    similarDistances = sortedIndices(1:sum(sortedDistances <= 0.99));

    similarRestaurants = [];

    i = 1;
    idx = 1;
    while i <=length(similarDistances) && length(similarRestaurants) < 3
        currentDistance = sortedDistances(i);
        tiedIndices = find(sortedDistances == currentDistance);
        if length(tiedIndices) == 1
            similarRestaurants(idx) = sortedIndices(tiedIndices);
            i = i+1;
            idx = idx+1;
        else
            tiedIDS = sortedIndices(tiedIndices);
            meanRatings = zeros(1, length(tiedIDS));
            for j=1:length(tiedIDS)
                restID = tiedIDS(j);
                restIndex = u(:, 2) == restID;
                meanRatings(j) = mean(u(restIndex, 3));
            end
            winner = tiedIDS(find(max(meanRatings)));
            similarRestaurants(idx) = winner;
            idx = idx+1;
            i = i+length(tiedIDS);
        end
        
    end
    [name, local, district, restaurantType, dish, ~] = getRestInfo(rest, restaurantID);
    % Display provided restaurant and three most similar restaurants
    fprintf('Comparing Restaurant:\nNAME: %s, LOCAL: %s, DISTRICT: %s, TYPE: %s, DISH: %s\n', name, local, district, restaurantType, dish);
    if isempty(similarRestaurants)
        fprintf('Similar restaurants NOT FOUND\n');
    else
        fprintf('Three Most Similar Restaurants:\n');
        for i = 1:length(similarRestaurants)
            restID = similarRestaurants(i);
            [restNAME, restLOCAL, restDISTRICT, restTYPE, restDISH, ~] = getRestInfo(rest, restID);
            fprintf('NAME: %s, LOCAL: %s, DISTRICT: %s, TYPE: %s, DISH: %s, JACCARD_DISTANCE: %.3f\n', restNAME, restLOCAL, restDISTRICT, restTYPE, restDISH, distances(restID));
        end
    end
end

function [restNAME, restLOCAL, restDISTRICT, restTYPE, restDISH, restCLOSED] = getRestInfo(rest, restaurantID)
    restNAME = rest{restaurantID, 2};
    restLOCAL = rest{restaurantID, 3};
    restDISTRICT = rest{restaurantID, 4}; 
    restTYPE = rest{restaurantID, 5}; 
    restDISH = rest{restaurantID, 6}; 
    if ismissing(restDISH)
        restDISH = '';
    end
    restCLOSED = rest{restaurantID, 7};
    if ismissing(restCLOSED)
        restCLOSED = '';
    end
end

function nRatings = calcNumberOfRatings(newUser, B, hashFunsBloom) 
    n = length(B);
    k = length(hashFunsBloom.a); %Number of hash functions
    
    %Getting the estimate number of ratings
    nRatingsArray = zeros(1, k);
    for i=1:k
        hash = mod(mod(mod(hashFunsBloom.a(i).*newUser + hashFunsBloom.b(i), hashFunsBloom.p), hashFunsBloom.M), n)+1;
        nRatingsArray(i) = B(hash);
    end

    nRatings = min(nRatingsArray);
end
     
    





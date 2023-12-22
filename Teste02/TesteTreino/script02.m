% Input the User ID
while 1
    userID = input("Insert User ID (1 to ??):");

    % Only breaks if valid 
    if any(userID >= 1) && any(userID <= length(users))
        break;
    end
end

while 1
    option = input("1 - Restaurants evaluated by you\n" + ...
        "2 - Set of restaurants evaluated by the most similar user\n" + ...
        "3 - Search Restaurant\n" + ...
        "4 - Find most similar restaurants\n" + ...
        "5 - Estimate the number of evaluations for each restaurant\n" + ...
        "6 - Exit\n" + ...
        "Select choice:");

    switch option
        case 1
            fprintf("-----------Evaluated Restaurants-----------\n");
            printEvaluatedRestaurants(userID, Set, rest);
            fprintf("------------------------------------------\n");
        case 2
            similarUserID = findSimilar(userID, signatures, Set);
            fprintf("-----------Evaluated Restaurants By Similar-----------\n");
            printEvaluatedRestaurants(similarUserID, Set, rest);
            fprintf("------------------------------------------------------\n");
        case 3
            %---%
        case 4
            %---%
        case 5
            %---%
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
        fprintf("ID:%3d NAME:%s CONCELHO:%s\n", restaurantID, restaurantNAME, restaurantCONCELHO);
    end
end

function similarUserID = findSimilar(userID, signatures, Set)
    distances = zeros(1,length(Set)-1);
    for u=1:length(Set)
        if u~=userID
            c1 = signatures(:, u);
            c2 = signatures(:, userID);

            distances(u)= 1 - sum(c1 == c2)/height(signatures);
        else
            distances(u) = Inf; %distância entre ele mesmo não conta
        end
    end
    [~,similarUserID] = min(distances);
end






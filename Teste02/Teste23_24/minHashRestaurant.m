function signatures = minHashRestaurant(rest)
    shingleSize = 5;
    k = 200;
    Nres = size(rest, 1);
    signatures = zeros(k, Nres);
    N = 1e6;
    hashFunsrest = initHashFunctions(N, k);

    for restaurantID = 1:Nres
        local = lower(rest{restaurantID, 3}); % Local in the 2nd column
        district = lower(rest{restaurantID, 4}); % Districts in the 4th column
        restaurantType = lower(rest{restaurantID, 5}); % Types in the 5th column
        dish = lower(rest{restaurantID, 6}); % Dishes in the 6th column
        if ismissing(dish)
            dish = '';
        end
        closed = lower(rest{restaurantID, 7}); % Closed time in the 7th column
        if ismissing(closed)
            closed = '';
        end
        combinedText = [local, ' ' , district, ' ', restaurantType, ' ', dish, ' ', closed]; % Combine all char vectors
        combinedText = strrep(combinedText, ' ', '');
        % Split combinedText into shingles
        shingles = {};
        for i = 1:length(combinedText) - shingleSize + 1
            shingles{i} = [combinedText(i:i + shingleSize - 1) ' '];
        end
        shingles = [shingles{:}];
            
        % Generate signatures using shingles
        for j = 1:k
            signatures(j, restaurantID) = carterMinHashFunction(hashFunsrest, j, shingles); 
        end
    end
end
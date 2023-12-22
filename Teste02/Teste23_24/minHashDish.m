function [signatures, hashFuns] = minHashDish(rest)
    shingleSize = 5;
    k = 200;
    Nres = height(rest);
    signatures = zeros(k, Nres);
    N = 1e6;
    hashFuns = initHashFunctions(N, k);

    for restaurantID=1:Nres
        dish = lower(rest{restaurantID, 6});
        if ismissing(dish)
            signatures(:,restaurantID) = -1; %if restaurant doesnt have dish ignores
        else
            dish = strrep(dish, ' ', '');
            shingles = {};
            if length(dish) < shingleSize
                shingles{1} = dish;
            else
                for i=1:length(dish)-shingleSize+1
                    shingles{i} = [dish(i:i+shingleSize-1) ' '] ;
                end
            end
            shingles = [shingles{:}];
            for j=1:k
                signatures(j, restaurantID) = carterMinHashFunction(hashFuns, j, shingles); 
            end

        end
    end
end
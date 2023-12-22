function signatures = minHash(Set)
    k = 200;
    N = 1e6;
    hashFuns = initHashFunctions(N, k);

    Nu = length(Set);
    signatures = zeros(k, Nu);
    for u = 1:Nu
        restaurants = Set{u};
        for j = 1:k
            signatures(j, u) = carterMinHashFunction(hashFuns, j, restaurants); 
        end
    end
end
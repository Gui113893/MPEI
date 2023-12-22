function [B, hashFunsBloom] = initBloomFilter(u)
    m = length(u);
    b = 10; % number of max bits per element
    % Choosing the best k and n values
    probFakePositive = 0.001; % 0.1% of false positives in maximum
    for i = 1e5:1e5:1e7
        n = i;
        k = round((0.693*n)/m); % best k in theory
        prob = (1 - exp(-k*m/n))^k;
        if prob <= probFakePositive
            break;
        end
    end
    N = 1e6;
    hashFunsBloom = initHashFunctions(N, k);
    % Initializing the bloom filter
    B = zeros(n, 1);
    % Inserting the elements
    for i = 1:m
        userID = u(i, 1);
        for j=1:k
            hash = mod(mod(mod(hashFunsBloom.a(j).*userID + hashFunsBloom.b(j), hashFunsBloom.p), hashFunsBloom.M), n)+1;
            if any(B(hash) == 2^b-1) % If the counter is full	
                break;
            end
            B(hash) = B(hash)+1; % Incrementing the counter
        end     
    end
end
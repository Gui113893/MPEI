function B = initBloomFilter(list, k, n)
    % Initializing the bloom filter
    B = zeros(n, 1);
    % Inserting the elements
    for i = 1:length(list)
         hashcodes = mod(kHashValues(list{i},k), n)+1;
         B(hashcodes) = B(hashcodes)+1; % Incrementing the counter
    end     
end
function B = initBloomFilter(u, n)
    % Initializing the bloom filter
    B = zeros(n, 1);
    % Inserting the elements
    for i = 1:size(u)
        hash = mod(string2hash(u{i}), n)+1;
        B(hash) = 1;     
    end
end
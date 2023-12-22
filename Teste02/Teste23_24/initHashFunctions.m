function hashFuns = initHashFunctions(N, k)
    p = primes(N*2);
    p = p(p>=N);

    p = p(randperm(length(p), 1));

    hashFuns.p = p;
    hashFuns.M = N;
    hashFuns.a = randi([1, (p-1)], 1, k);
    hashFuns.b = randi([0, (p-1)], 1, k);
end
function minHash = carterMinHashFunction(hashFuns, k, x)
    % Método de Carter and Wegman
    % h(x) = ((ax + b)mod p)mod M
   

    minHash = min(mod(mod(hashFuns.a(k).*x + hashFuns.b(k), hashFuns.p), hashFuns.M));
end
function boolean = isElementInC(x, B, k)
    %Verifica se o elemento x está num Bloom Filter B com k funções
    %dispersão
    n = length(B);
    booleanArray = zeros(k, 1);
    for i=1:k
        x = [x num2str(i)];
        h = mod(sdbm(x), n)+1;
        if B(h) == 1
            booleanArray(i) = 1;
        end
    end    
    if sum(booleanArray) == k
        boolean = 1;
    else
        boolean = 0;
    end
end
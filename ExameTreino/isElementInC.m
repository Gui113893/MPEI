function boolean = isElementInC(x, B)
    %Verifica se o elemento x está num Bloom Filter B 
    n = length(B);
    h = mod(string2hash(x), n)+1;
    boolean = 0;
    if B(h) == 1
        boolean = 1;
    end 
end
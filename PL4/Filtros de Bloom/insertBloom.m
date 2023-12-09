function B = insertBloom(B, k, C)
    %B é o Bloom Filter
    %k é o número de funções dispersão
    %C é o conjunto que se pretende inserir no Bloom Filter
    n = length(B);
    for str_idx=1:length(C)
        str = C{str_idx};
        for i=1:k
            str = [str num2str(i)];
            h = mod(sdbm(str),n)+1;
            B(h) = 1;
        end
    end
end
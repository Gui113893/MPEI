frase1 = 'Lisboa e Porto são duas cidades importantes de Portugal.';
frase2 = 'Lisboa é a capital de Portugal.';
frase3 = 'Porto é a capital do Norte de Portugal.';
frase4 = 'Portugal não é só Lisboa e Porto.';

frases = {frase1, frase2, frase3, frase4}';
shinglesize = 3;
k = 4;
signatures = zeros(k , 4);
for nhf = 1:k
    for i = 1:4
        frase = frases{i};
        nshingles = length(frase) - shinglesize + 1;
        hashcodes = zeros(nshingles, 1);
        for j = 1:nshingles
            shingle = frase(j:j+2);
            hashcodes(j) = hf1(shingle,nhf);
        end
        signatures(nhf, i) = min(hashcodes);
    end
end
J = zeros(4);
for n1 = 1:4
    for n2 = n1+1:4
        c1 = signatures(:, n1);
        c2 = signatures(:, n2);

        J(n1, n2) = sum(c1 ~= c2)/k;
    end
end






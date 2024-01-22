%% Generating words
N = 1e4;
chars = char('a':'z')';
iMin = 5;
iMax = 8;
[words] = keyGenerator(N, iMin, iMax, chars);

%% a)
m = 300;  % número de elementos a inserir
probFakePositive = 0.03; % 3% de probabilidade de falsos positivos

for i = 1e2:1:1e7
    n = i;
    k = 1;  % k funções dispersão
    prob = (1 - exp(-k*m/n))^k;  % probabilidade de falsos positivos
    if prob <= probFakePositive
        break;
    end
end
fprintf("Tamanho adequado do filtro de bloom: %d\n", i);

%% b)
B = initBloomFilter(words(1:300), n);
words2 = words(301:10000);
booleanArray = zeros(1, 300);
for i = 1:9700
    booleanArray(i) = isElementInC(words2{i}, B);
end

%calcular falsos positivos
fake = 0;
for i = 1:9700
    if booleanArray(i) == 1
        fake = fake + 1;
    end
end
probfake = fake / 9700;
fprintf("Probabilidade de falsos positivos: %.3f\n", probfake);

















%a)

N = 1e5;
n = 5;
p = 0.3;

pecas = rand(n, N) < 0.3;
defeito = sum(pecas);
pX = zeros(1, 6);

for i = 0:5
    pX(i+1) = sum(defeito == i) / N;
end
%i
disp(pX);

%ii
f_distribuicao = cumsum(pX);
disp(f_distribuicao);

%iii
Piii = pX(1) + pX(2) + pX(3);
disp(Piii);


%b)

pXTeorica = zeros(1, 6);

for k = 0:5
    pXTeorica(k+1) = nchoosek(5, k) * (p)^k * (p)^(5 - k);
end
disp(pXTeorica);
disp(cumsum(pXTeorica));


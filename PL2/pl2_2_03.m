%a)
figure(1);
N = 1e5;
n = 4;
lancamentos = rand(n, N) > 0.5;
coroas = sum(lancamentos);
pX = zeros(1, 5);
for i = 0:4
    pX(i+1) =  sum(coroas == i) / N;
end
stem(0:4, pX);
grid on;

%b)
Ex = sum((0:4) .* pX)

variancia = sum(((0:4) - Ex).^2 .* pX)

desvio = sqrt(variancia)

%c)

%Distribuição de probabilidade binomial pois cada lançamento da moeda é um
%evento binário (cara ou coroa) e os lançamentos são independentes e têm a
%mesma probabilidade de sucesso em cada tentativa.

%P(X = k) = C(n k) . (p)^k . (p)^(n - k)
%p = 0.5 e n = 4
%P(X = k) = C(4 k) . (0.5)^k . (0.5)^(4 - k)

%d)

teorica = zeros(1, 5);

for k = 0:4
    teorica(k+1) = nchoosek(4, k) * (0.5)^k * (0.5)^(4 - k);
end

for k = 0:4
    fprintf("K = %d:\n", k);
    fprintf("Teórico: %.3f\n", teorica(k+1));
    fprintf("Estimado: %.3f\n", pX(k+1));
end

%e)
ExTeorico = sum((0:4) .* teorica);

varianciaTeorico = sum(((0:4) - Ex).^2 .* teorica);

fprintf("E[x] Teórico: %.3f\n", ExTeorico);
fprintf("E[x] Estimado: %.3f\n", Ex);
fprintf("Var(X) Teórico: %.3f\n", varianciaTeorico);
fprintf("Var(X) Estimado: %.3f\n", variancia);

%f)

%i
Pi = teorica(3) + teorica(4) + teorica(5)

%ii
Pii = teorica(1) + teorica(2)

%iii
Piii = teorica(2) + teorica(3) + teorica(4)



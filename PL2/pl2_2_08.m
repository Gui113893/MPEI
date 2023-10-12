lambda = 0.02;
k = 1;
n = 100;

prob1 = 0;
for k = 0:1
    prob1 = prob1 + ((lambda)^k * exp(-lambda))/factorial(k);
end

probTotal = prob1^n;

fprintf("Probabilidade de no máximo 1 erro em 100 páginas: %.3f", probTotal);
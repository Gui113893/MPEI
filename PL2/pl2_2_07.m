
lambda = 15;

%a)
k = 0;
poisson = ((lambda)^k * exp(-lambda))/factorial(k);
fprintf("Probabilidade de não receber mensagem: %.10f\n", poisson);


%b)
k = 10;
poisson_complementar = 0;
for i = 0:k
    poisson_complementar = poisson_complementar + ((lambda)^k * exp(-lambda))/factorial(k);
end

poisson = 1 - poisson_complementar;
fprintf("Probabilidade de receber mais de 10 mensagens: %.10f\n", poisson);
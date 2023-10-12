N = 1e5;
media = 14;
desvio_padrao = 2;
X = normrnd(media, desvio_padrao, N, 1);

%a)
prob_A = sum(X >= 12 & X <= 16)/ N;
fprintf("Probabilidade a) : %.3f\n", prob_A);

%d)
prob_D = 1 - sum(normcdf(12, X)) / N - (1 - sum(normcdf(16, X)) / N);
fprintf("Probabilidade de d) comparado a a) : %.3f\n", prob_D);

%b)
prob_B = sum(X >= 10 & X <= 18) / N;
fprintf("Probabilidade b) : %.3f\n", prob_B);

%d)
prob_D = 1 - sum(normcdf(10, X)) / N - (1 - sum(normcdf(19, X)) / N);
fprintf("Probabilidade de d) comparado a b) : %.3f\n", prob_D);

%c)
prob_C = sum(X >= 10) / N;
fprintf("Probabilidade c) : %.3f\n", prob_C);

%d)
prob_D = 1 - sum(normcdf(10, X)) / N;
fprintf("Probabilidade de d) comparado a c) : %.3f\n", prob_D);

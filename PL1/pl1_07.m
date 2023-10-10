p = 0.3;
n = 5;
N = 1e5;

%a)

k = 3;
lancamentos = rand(n, N) < p;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos) / N;

disp(probSimulacao);

%b)
k = 2;
lancamentos = rand(n, N) < p;
sucessos = sum(lancamentos) <= k;
probSimulacao = sum(sucessos) / N;

disp(probSimulacao);

%c)
x = 0:n;
    for i=1:length(x)
        sucessos = sum(lancamentos) == i-1;
        x(1, i) = sum(sucessos) / N;
    end
stem(0:n, x);





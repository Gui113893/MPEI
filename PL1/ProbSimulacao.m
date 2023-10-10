function [x] = ProbSimulacao(p, n, N)
    lancamentos = rand(n, N) > p;
    x = 0:n;
    for i=1:length(x)
        sucessos = sum(lancamentos) == i-1;
        x(1, i) = sum(sucessos) / N;
    end
end
    



    

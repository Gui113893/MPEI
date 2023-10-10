p = 0.5;
N = 1e5;

%a)
n = 2;
k = 1;

rapazes = rand(n, N) > p;
sucessos = sum(rapazes) >= k;
probSimulacaoA = sum(sucessos)/N


%b)
teoricoA = nchoosek(n, k) * p^k * (1-p)^(n-k);
k = 2;
teoricoA = teoricoA + nchoosek(n, k) * p^k * (1-p)^(n-k)


%c) 
n = 2;
k = 2;
rapazes = rand(n, N) > p;
sucessos = sum(rapazes) == k;
probSimulacaoC = sum(sucessos)/N
teoricoC = nchoosek(n, k) * p^k * (1-p)^(n-k)

%d)
n = 2;
rapazes = rand(n, N) > p;

%P(A|B) = P(A&B) / P(B)
B = rapazes(1,:) == 1; %familias em que o primeiro filho é rapaz
A = rapazes(2,:) == 1; %familias em que o segundo filho é rapaz
probSimulacaoD = (A&B) / B

%e)
sucessos = 0;

for i = 1:N
    rapazes = randi([0, 1], 1, 5);
    
    
    if any(rapazes == 1)
       
        outros_rapazes = sum(rapazes(2:end) == 1);
        
       
        if outros_rapazes == 1
            sucessos = sucessos + 1;
        end
    end
end

probSimulacaoE = sucessos / N

%f)
sucessos = 0;

for i = 1:N
    rapazes = randi([0, 1], 1, 5);
    
    
    if any(rapazes == 1)
       
        outros_rapazes = sum(rapazes(2:end) == 1);
        
       
        if outros_rapazes >= 1
            sucessos = sucessos + 1;
        end
    end
end

probSimulacaoF = sucessos / N








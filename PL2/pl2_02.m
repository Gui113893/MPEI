N = 1e5;

%a)

n = 20;
m = 100;
erros = 0;
for i=1:N
    alvos = zeros(1, m);
    for j=0:n
        random_indice = randi([1, m], 1, 1);
        alvos(1, random_indice(1, 1)) = alvos(1, random_indice(1, 1)) + 1;
    end
    if any(alvos > 1)
        erros = erros + 1;
    end
end
probSimulacaoA = 1 - (erros/N)
      
%b)
sucessos = 0;
for i=1:N
    alvos = zeros(1, m);
    for j=0:n
        random_indice = randi([1, m], 1, 1);
        alvos(1, random_indice(1, 1)) = alvos(1, random_indice(1, 1)) + 1;
    end
    if any(alvos >= 2)
        sucessos = sucessos + 1;
    end
end
probSimulacaoB = sucessos/N

%c)
n = 10:10:100;
m = 1000;
p1 = zeros(1, 10);

for k=1:10
    sucessos = 0;
    for i=0:N
        alvos = zeros(1, m);
        for j=0:n(1, k)
            random_indice = randi([1, m], 1, 1);
            alvos(1, random_indice(1, 1)) = alvos(1, random_indice(1, 1)) + 1;
        end
        if any(alvos >= 2)
            sucessos = sucessos + 1;
        end
    end
    p1(1, k) = sucessos/N;
end
subplot(2, 1, 1);
plot(n, p1);

m = 100000;
p2 = zeros(1, 10);

for k=1:10
    sucessos = 0;
    for i=0:N
        alvos = zeros(1, m);
        for j=0:n(1, k)
            random_indice = randi([1, m], 1, 1);
            alvos(1, random_indice(1, 1)) = alvos(1, random_indice(1, 1)) + 1;
        end
        if any(alvos >= 2)
            sucessos = sucessos + 1;
        end
    end
    p2(1, k) = sucessos/N;
end
subplot(2, 1, 2);
plot(n, p2);















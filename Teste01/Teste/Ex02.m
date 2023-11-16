close all;
clear all;
load("L.mat");
N = size(L);
S = sum(L);
%a)
disp("a) N");
disp(N(1));
dead_ends = find(S == 0);
disp("dead_ends");
disp(dead_ends);

%b)
H = zeros(N);
for i = 1:N(2)
    n = sum(L(:, i));
    if (n ~= 0)
        H(:, i) = L(:,i) / n;
    end
end
fprintf("A matriz H e");
disp(H);

%c)
B = 0.85;
A = B*H + (1-B)*(1/N(1)*ones(N(1), N(2)));
disp("c) A = ");
disp(A);

%d)

r = zeros(90, 91);
r0 = ones(N(1), 1) / N(1);
r(:, 1) = r0;
r(:, 2) = H * r0;
max_diff = 0;

%Limite de tolerância
limit = 10^(-4);
for i = 2:90
    r(:, i+1) = H * r(:, i);
    % Verificar a diferença entre  2 iterações consecutivas
    max_diff = abs(r(:, i) - r(:, i-1));
    % Se a diferença for menor que o limite, interrompe o loop
    if max_diff < limit
        disp(['Diferença maior que limite alcançada após ', num2str(i), ' iterações.'])
        break;
    end
end

disp("d) PageRank de cada página:");
disp(r(:, i));

%e)
r1 = H*r0;
firstv=0;
first=0;
for i=1:90
    if r1(i) > firstv
        firstv = r1(i);
        first=i;
    end
end
r1(first)=0;
secondV = 0;
second = 0;

for i=1:90
    if r1(i) > secondV
        secondV = r1(i);
        second=i;
    end
end
r1(second) = 0;

thirdV = 0;
third = 0;

for i=1:90
    if r1(i) > thirdV
        thirdV = r1(i);
        third=i;
    end
end
r1(third) = 0;
disp("e) Maiores pageranks e respetivos valores");
fprintf("%d - %.4f of Pagerank\n", first, firstv);
fprintf("%d - %.4f of Pagerank\n", second, secondV);
fprintf("%d - %.4f of Pagerank\n", third, thirdV);







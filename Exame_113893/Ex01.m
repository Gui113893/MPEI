%% a)
T = [0 0.8 0 0 0
     0 0 0.8 0 0
     1 0 0 0 0
     0 0.2 0 1 0
     0 0 0.2 0 1];
disp("T =")
disp(T);

%% b)
X0 = [0 0 1 0 0]';   %estado inicial = 3
X6 = T^6 * X0;   %matriz dos estados após 6 iterações
prob = X6(3);  % probabilidade de estar no estado 3 após 6 iterações
fprintf("Probabilidade = %.4f\n", prob);

%% c)
% T já está na sua forma canónica
Q = T(1:3, 1:3);  % Matriz dos Transientes
F = inv(eye(3) - Q); %Matriz Fundamental
nmedio = sum(F(:,3));
fprintf("Nºmédio: %.4f\n", nmedio);

%% d)
R = T(4:5, 1:3);
B = R * F;
%Começando no estado 3
i = 3;
%Ser absorvido no estado 5
j = 2;

pAbsorv = B(j, i);

fprintf("Probabilidade: %.4f\n", pAbsorv);

















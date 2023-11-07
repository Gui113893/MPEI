%a)

T = [0.8, 0, 0, 0.3, 0;
    0.2, 0.6, 0, 0.2, 0; 
    0, 0.3, 1, 0, 0; 
    0, 0.1, 0, 0.4, 0; 
    0, 0, 0, 0.1, 1];
disp("a) T = ");
disp(T);

%b)

X0 = [1 0 0 0 0]';
X = zeros(1, 100);
X(1,1) = X0(1,1);

for i=2:100
    Xaux = T^(i-1) * X0;
    X(1, i) = Xaux(2,1);
end

figure(1);
title("b)");
plot(1:100, X);

%c)
X3 = zeros(1, 100);
X5 = zeros(1, 100);
X3(1,1) = X0(3,1);
X5(1,1) = X0(5,1);

for i=2:100
    Xaux = T^(i-1) * X0;
    X3(1, i) = Xaux(3,1);
    X5(1, i) = Xaux(5,1);
end

figure(2);
plot(1:100, X3, "b");
hold on;
plot(1:100, X5, "g");
hold off;

%d)
T_canonica = [0.8, 0, 0.3, 0, 0
              0.2, 0.6, 0.2, 0, 0
              0, 0.1, 0.4, 0, 0 
              0, 0.3, 0, 1, 0
              0, 0, 0.1, 0, 1];
Q = T_canonica(1:3, 1:3);   %Matriz dos Transientes
disp("d) Q = ");
disp(Q);

%e)
F = inv(eye(3) - Q);  %Matriz Fundamental
disp("e) F = ");
disp(F);

%f)
%Nº Médio de passos começando no estado 1
nPassos1 = sum(F(:, 1)) / 3;
%Nº Médio de passos começando no estado 2
nPassos2 = sum(F(:, 2)) / 3;
%Nº Médio de passos começando no estado 4
nPassos3 = sum(F(:, 3)) / 3;

disp("d) Número médio de passos começando no estado 1");
disp(nPassos1);
disp("Número médio de passos começando no estado 2");
disp(nPassos2);
disp("Número médio de passos começando no estado 4");
disp(nPassos3);

%g)
R = T_canonica(4:5, 1:3); %Matriz de transição de não absorventes para absorventes
B = R * F; %Matriz probabilidades de absorção bji no estado j se começar no estado i
%Começando no estado 1
i = 1;
%Ser absorvido no estado 3
j = 1;

pAbsorv3 = B(j, i); % Probabilidade de ser absorvido no estado 3 começando no estado 1

%Ser absorvido no estado 5
j = 2;

pAbsorv5 = B(j, i); % Probabilidade de ser absorvido no estado 5 começando no estado 1

disp("g) Probabilidade de ser absorvido no estado 3 começando no estado 1");
disp(pAbsorv3);
disp("Probabilidade de ser absorvido no estado 5 começando no estado 1");
disp(pAbsorv5);










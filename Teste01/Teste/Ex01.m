%
%T(j,i) é a probabilidade de passar do estado i para o j
%
%                       |   A   |   B   |   C   |   D   |
%                       |       |       |       |       |
%                  A    |  0.1  |  0.3  |  0.40 |  0.30 |
%                       |       |       |       |       |
%                  B    |  0.3  |  0.1  |  0.25 |  0.30 |
%                       |       |       |       |       |
%                  C    |  0.3  |  0.3  |  0.10 |  0.20 |
%                       |       |       |       |       |
%                  D    |  0.3  |  0.3  |  0.25 |  0.20 |
%                       |       |       |       |       |
%b) 
T = [0.1, 0.3, 0.4, 0.3;
     0.3, 0.1, 0.25, 0.3;
     0.3, 0.3, 0.1, 0.2;
     0.3, 0.3, 0.25, 0.2];
disp("b) Matriz transição de estados");
disp(T);

%c)
X0 = [0.25, 0.25, 0.25, 0.25]'; %Probabilidade da 1ª publicidade ás 7:00
X10 = T^10 * X0;   %Matriz das probabilidades ás 7:10
disp("c) Probabilidade de ser escolhido B as 7:10");
disp(X10(2));

%d) 
M = [T - eye(4); ones(1,4)];  %Tu = u <=> (T-I)u = 0
x = [0 0 0 0 1]'; %u1 + u2 + u3 + u4 + u5 = 1
u = M\x;
disp("d) Probabilidades limite");
disp(u);
P = u(2)*60; %Probabilidade, em média (em minutos), de B em 1 hora
disp("Probabilidade, em média (em minutos), de B em 1 hora");
disp(P);

%e)
X2 = T^2 * X0; %Matriz das probabilidades da terceira publicidade
P3 = X2(1) %Probabilidade de ser A no terceiro minuto
P6 = P3 * T(2,1) * T(2,2) * T(1,2) %Probabilidade de XXABBA
X5 = [1 0 0 0]'; %Partimos de A
X7 = T^2 * X5; %Matriz probabilidade em AXX
P8 = sum(P6*X7)






%b)
T = [0.1, 0.25, 0.2, 0.25;
     0.3, 0.25, 0.2, 0.25;
     0.3, 0.25, 0.4, 0.25;
     0.3, 0.25, 0.2, 0.25];
%c)
X1 = [0.25; 0.25; 0.25; 0.25];
X7 = T^6 * X1;
disp("X7=");
disp(X7);
disp("P(7º ser Floresta)=");
disp(X7(2,1));

%d)
M = [T - eye(4); ones(1,4)];
x = [0 0 0 0 1]';
u = M\x;
disp("d) Probabilidade limite de ser escolhido cenário Floresta = ");
disp(u(2,1));

%e)
disp("e)");

%Algoritmo: Sabe-se o início, desconhece-se o meio e sabe-se o fim
P2 = T(3,3)*X1(3); %Calcula-se até onde se sabe do início
X2 = [0 0 1 0]';  %Parte-se do último estado conhecido
X4 = T^2*X2;    %Calcula-se o salto de estados desconhecidos
P4 = X4(4);  %Vai-se buscar o valor do primeiro estado conhecido depois do salto
P5 = P4 * T(4,4); %Calcula-se a probabilidade de estados conhecidos do fim
P = P5*P2; %Multiplica-se pela probabilidade até onde se sabia do início
disp(P);




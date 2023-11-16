%
%                       |   A   |   B   |   C   |   D   |
%                       |       |       |       |       |
%   P(passar A)         |  0.1  |  0.3  |  0.25 |  0.5  |
%                       |       |       |       |       |
%   P(passar B)         |  0.3  |  0.1  |  0.25 |  0.3  |
%                       |       |       |       |       |
%   P(passar C)         |  0.3  |  0.3  |  0.10 |  0.1  |
%                       |       |       |       |       |
%   P(passar D)         |  0.3  |  0.3  |  0.40 |  0.1  |
%                       |       |       |       |       |


T = [0.1 0.3 0.25 0.5;
     0.3 0.1 0.25 0.3;
     0.3 0.3 0.10 0.1;
     0.3 0.3 0.40 0.1;]

estado_inicial = ones(length(T), 1) / length(T);

fprintf("Matriz de transiçao de estados:\n");
disp(T);
fprintf("Estado inicial: \n")
disp(estado_inicial);

%% c)

% Se muda de 2 em 2 minutos, entao as 7:10 estara no 6 estado, tendo
% sofrido 5 transiçoes

estado_7_10 = T^5 * estado_inicial;
prob_publicidade_b = estado_7_10(2);

%% d)

% Temos de calcular o steady-state vector da matriz de transiçao

% Calculo do steady-state vector:
N = length(T);
AUX = [T - eye(4); ones(1,4)];
steady_state_vector = AUX\[zeros(N(1),1); 1];
fprintf("Probabilidades estacionarias:\n");
disp(steady_state_vector);

% Probabilidades estacionarias:
%    0.2860
%    0.2414
%    0.2055
%    0.2671


% Das 12h ass 24h passa-se um periodo de 12 horas. Ou seja, temos um total
% de 12 periodos de uma hora, sendo que cada periodo de uma hora contem 30
% transicoes

% Se o estado estacinario nos indica que a probabilidade de passar para o
% estado B e de 0.2414, entao, em media, 24.14% do tempo sera uma
% publicidade a empresa B. Como tal, por hora a publicidade a empresa B
% sera exposta um total de 0.2414 * 60 minutos = 14.4840 minutos, em media

%% e)

% Sabemos que a probabilidade de o primeiro estado ser 
% A e 0.25
p_1 = estado_inicial;

p_2 = T * [1 0 0 0]';
p_3 = T  * [0 1 0 0]';
p_4 = T * p_3;
p_5 = T * p_4;
p_6 = T * p_5;
p_6 = T^3 * p_2;
p_7 = T * [0 1 0 0]';


% Em vez de calcular individualmente p_3, p_4, p_5 e p_6, 
% podemos apenas exponenciar a matriz de transicao

probabilidade_final = p_1(1) * p_2(2) * p_6(2) * p_7(1)

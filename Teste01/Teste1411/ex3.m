%
%               |   1   |   3   |   5   |   7   |   9   |   FIM   |
%               |       |       |       |       |       |         |
%   P(passar 1) |   0   |  0.3  |   0   |  0.3  |   0   |    0    |
%               |       |       |       |       |       |         |
%   P(passar 3) |  1/3  |   0   |  0.5  |   0   |  0.45 |    0    |
%               |       |       |       |       |       |         |
%   P(passar 5) |  1/3  |  0.3  |   0   |  0.3  |   0   |    0    |
%               |       |       |       |       |       |         |
%   P(passar 7) |  1/3  |   0   |  0.5  |   0   |  0.45 |    0    |
%               |       |       |       |       |       |         |
%   P(passar 9) |   0   |  0.3  |   0   |  0.3  |   0   |    0    |
%               |       |       |       |       |       |         |
%   P(passa FIM |   0   |  0.1  |   0   |  0.1  |  0.1  |    1    |
%               |       |       |       |       |       |         |
%

T = [0   0.3 0   0.3 0    0;
     1/3 0   0.5 0   0.45 0;
     1/3 0.3 0   0.3 0    0;
     1/3 0   0.5 0   0.45 0;
     0   0.3 0   0.3 0    0;
     0   0.1 0   0.1 0.1  1];

%% c)
states = [1 3 5 7 9];
initial_probabilities = [1/4 1/8 1/4 1/4 1/8 0];
cummulative_probabilities = cumsum(initial_probabilities);
initial_state = find((rand < cummulative_probabilities) == 1);
initial_state = initial_state(1);
generated_string = crawl(T, initial_state, 6);
fprintf("A string gerada foi: ")
for i = generated_string(1 : end - 1)
    fprintf("%d", states(i));
end
fprintf("\n");

%% d)

N = 1e6;
simulations = cell(1,N);
initial_probabilities = [1/4 1/8 1/4 1/4 1/8];
cummulative_probabilities = cumsum(initial_probabilities);
for i = 1:N
    initial_state = find((rand < cummulative_probabilities) == 1);
    initial_state = initial_state(1);
    simulations{i} = crawl(T, initial_state, 6);
end

%% e)

% A string '97153' corresponde ao vetor de estados [5 4 1 3 2 6], pois
% temos que contar com o final;

counter = 0;
for i = 1:N
    string = simulations{i};
    if length(string) == 6 & string == [5 4 1 3 2 6]
        counter = counter + 1;
    end
end

prob_simulada = counter / N;
fprintf("A probabilidade de gerar a string 97153 e %.5f\n", prob_simulada)

%% f)

% Probabilidade de 1o digito ser 9
p_1o_digito = initial_probabilities;

% Probabilidade de 2o digito ser 7 sendo que 1o foi 9
p_2o_digito = T * [0 0 0 0 1 0]';

% Probabilidade de 3o digito ser 1 sendo que 2o foi 7
p_3o_digito = T * [0 0 0 1 0 0]';

% Probabilidade de 4o digito ser 5 sendo que 3o foi 1
p_4o_digito = T * [1 0 0 0 0 0]';

% Probabilidade de 5o digito ser 3 sendo que 1o foi 5
p_5o_digito = T * [0 0 1 0 0 0]';

% Probabilidade de 6o digito ser FIM sendo que 1o foi 3
p_6o_digito = T * [0 1 0 0 0 0]';

prob_algebrica = p_1o_digito(5) * p_2o_digito(4) * p_3o_digito(1) * p_4o_digito(3) * p_5o_digito(2) * p_6o_digito(6);
fprintf("A probabilidade de gerar a string 97153 e %.5f\n", prob_algebrica);

%% g)
sum = 0;
countT = 0;
for i = 1:N
    if simulations{i}(1) == 4
        countT = countT + 1;
        sum = sum + length(simulations{i}) - 1;
    end
end

average_string_size = sum / countT;
fprintf("O tamanho medio de uma string e %f\n", average_string_size);

%% g) algebricamente
% N_estados_absorventes = 1;
% Q = T(1:end - N_estados_absorventes, 1:end - N_estados_absorventes);
% F = (eye(length(Q)) - Q)^-1;
% tempo_de_absorcao = F' * ones(length(Q), 1);
% printf("Tamanho medio da string, calculado algebricamente %f\n", tempo_de_absorcao(4));
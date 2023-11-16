%b)
%
%T(j,i) é a probabilidade de passar do estado i para o j
%
%                       |   1   |   3   |   5   |   7   |  9  |  FIM  |
%                       |       |       |       |       |     |       |
%                  1    |   0   |  0.25 |  0    |  0.25 |  0  |  0    | 
%                       |       |       |       |       |     |  0    |
%                  3    |  1/3  |  0    |  0.50 |  0    |0.375|  0    |
%                       |       |       |       |       |     |  0    |
%                  5    |  1/3  |  0.25 |  0    |  0.25 |  0  |  0    |
%                  7    |  1/3  |  0    |  0.50 |  0    |0.375|  0    |
%                  9    |  0    |  0.25 |  0    |  0.25 |  0  |  0    |
%                  FIM  |  0    |  0.25 |  0    |  0.25 | 0.25|  1    |
T = [0, 0.25, 0, 0.25, 0 , 0;
     1/3, 0, 0.5, 0, 0.375,0;
     1/3, 0.25, 0, 0.25, 0, 0;
     1/3, 0, 0.5, 0, 0.375,0;
     0, 0.25,0,0.25,0,0;
     0,0.25,0,0.25,0.25,1];
%c)

estados = [1 3 5 7 9];
P0 = [1/4 1/8 1/4 1/4 1/8 0]; %probabilidades iniciais
cummulative_probabilities = cumsum(P0);
estado_inicial = find((rand < cummulative_probabilities) == 1);
estado_inicial = estado_inicial(1);
generated_string = crawl(T, estado_inicial, 6);
fprintf("A string gerada foi: ")
for i = generated_string(1 : end - 1)
    fprintf("%d", estados(i));
end
fprintf("\n");


%d)

N = 1e6;
simulations = cell(1,N);
initial_probabilities = [1/4 1/8 1/4 1/4 1/8];
cummulative_probabilities = cumsum(initial_probabilities);
for i = 1:N
    initial_state = find((rand < cummulative_probabilities) == 1);
    initial_state = initial_state(1);
    simulations{i} = crawl(T, initial_state, 6);
end
%e)
% A string '71539' corresponde ao vetor de estados [4 1 3 2 5 6], pois

counter = 0;
for i = 1:N
    string = simulations{i};
    if length(string) == 6 & string == [4 1 3 2 5 6]
        counter = counter + 1;
    end
end

prob_simulada = counter / N;
fprintf("A probabilidade de gerar a string 71539 e %.5f\n", prob_simulada)


function [state] = crawl(H, first, last)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     state = [first];
     % keep moving from state to state until state "last" is reached:
     while (1)
          state(end+1) = nextState(H, state(end));
          if ismember(state(end), last) % verifies if state(end) is absorving
              break;
          end
     end
end

function state = nextState(H, currentState)
     % find the probabilities of reaching all states starting at the current one:
     probVector = H(:,currentState)';  % probVector is a row vector 
     n = length(probVector);  %n is the number of states
     % generate the next state randomly according to probabilities probVector:
     state = discrete_rnd(1:n, probVector);
end
function state = discrete_rnd(states, probVector)
     U=rand();
     i = 1 + sum(U > cumsum(probVector));
     state= states(i);
end







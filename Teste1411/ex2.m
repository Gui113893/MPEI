close all;
clear all;
load("L.mat");
N = size(L);
S = sum(L);

estado_inicial = ones(N(1), 1) / N(1);

%% a)

fprintf("N = %d\n", N(1));
fprintf("Dead ends:\n");
dead_ends = find(S == 0);
disp(dead_ends);

%% b)

H = zeros(N);
for i = 1:N(2)
    n = sum(L(:, i));
    H(:, i) = L(:,i) / n;
end
fprintf("A matriz H e");
disp(H);

%% c)

beta = 0.85;
for i = dead_ends
    H(:, i) = ones(1, N(1)) / N(1);
end

random = ones(N) / N(1);
google = (H * beta) + (random * (1 - beta));

%% d)

% Apliquemos o power method

iter = 1;
state = estado_inicial;
epsilon = 1e-4;

while 1
    fprintf("Iteracao %d\n", iter);
    old_state = state;
    state = google * state;
    if max(abs(state - old_state)) < epsilon break; end
    iter = iter + 1;
end

%% e)

for i = dead_ends
    fprintf("O pagerank do dead_end %d e %.3f.\n",i, state(i));
end
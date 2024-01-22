%% a)
T = [0 0 0 0 0 0
     0.2 0 0 0 0 0
     0 0 0 0.1 0.45 0
     0 0 0.3 0 0.55 0
     0.8 1 0.7 0 0 0
     0 0 0 0.9 0 1];
%% b)
X0 = [1 0 0 0 0 0]';
P = X0(1) * T(5,1) * T(4, 5) * T(6, 4);
fprintf("P = %f\n", P);

%% c)
% tempo médio até absorção = sum(F) ou F' * ones(n, 1)
% prob absorção B = R F

Q = T(1:5, 1:5);  % Matriz dos Transientes
F = inv(eye(5) - Q); %Matriz Fundamental
ncasasMedia = sum(F(:,1))+1;
fprintf("Nº casas média: %.4f\n", ncasasMedia);

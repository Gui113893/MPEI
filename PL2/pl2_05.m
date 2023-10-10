N = 1e5;
faces = 6;
n = 2;

%a)

%A
lancamentos = randi(faces, n, N);
sucessos = sum(lancamentos) == 9;
probA = sum(sucessos)/N

%B
sucessos = mod(lancamentos(2, :), 2) == 0;
probB = sum(sucessos)/N

%C
A = lancamentos(1, :) == 5; % O primeiro dado é 5
B = lancamentos(2, :) == 5; % O segundo dado é 5

probC = sum(A + B - (A&B))/N

%D
A = lancamentos(1, :) == 1; % O primeiro dado é 1
B = lancamentos(2, :) == 1; % O segundo dado é 1

probND = sum(A + B - (A&B))/N;
probD = 1 - probND


%b)

A = 4/36;
B = 3/6;
ANB = 2/36;
Ib = ANB == A*B

%c)

C = 11/36;
D = 1 - C;
CND = (4 + 4 + 1)/36;
Ic = CND == C*D







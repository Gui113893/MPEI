%a)
figure(1);
probabilidade = 1/6;

valores_possiveis = 1:6;

stem(valores_possiveis, probabilidade * ones(1, 6));
grid on;

%b)
figure(2);
f_distribuicao = cumsum(probabilidade * ones(1, 6));

stairs([0, valores_possiveis], [0, f_distribuicao]);
grid on;
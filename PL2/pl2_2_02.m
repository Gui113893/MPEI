%a)
total = 90 + 9 + 1;

espaco_amostragem = [5, 50, 100];

p_5 = 90/total
p_50 = 9/total
p_100 = 1/total

%b)
figure(1);
probabilidades = [p_5, p_50, p_100];
stem(espaco_amostragem, probabilidades);
grid on;

%c)
figure(2);
f_distribuicao = cumsum(probabilidades);

stairs([0, espaco_amostragem], [0, f_distribuicao]);
grid on;



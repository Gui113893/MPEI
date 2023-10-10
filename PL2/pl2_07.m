%a)

%P[O programa é do Carlos | O programa tem erro]

P_erro = (20*0.01 + 30*0.05 + 0.001 * 50) / 100;
P_erroNCarlos = (0.001*50)/100;

probA = P_erroNCarlos / P_erro

%b)

P_erroNAndre = (0.01*20)/100;
probAndre = P_erroNAndre / P_erro;
P_erroNBruno = (0.05*30)/100;
probBruno = P_erroNBruno / P_erro;

Array = ["Andre", probAndre ; "Bruno", probBruno;"Carlos", probA]



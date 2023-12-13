load("hashcodes1.mat");
load("hashcodes2.mat");
load("hashcodes3.mat");
load("hashcodes4.mat");

load("tempos_execucao1.mat");
load("tempos_execucao2.mat");
load("tempos_execucao3.mat");
load("tempos_execucao4.mat");

load("colisoes1.mat");
load("colisoes2.mat");
load("colisoes3.mat");
load("colisoes4.mat");

load("atribuicoes1.mat");
load("atribuicoes2.mat");
load("atribuicoes3.mat");
load("atribuicoes4.mat");

load("table_sizes.mat");

%a) i)
figure(1);
Uniformidade_1(hashcodes1, table_sizes, "DJB31MA");

figure(2);
Uniformidade_1(hashcodes2, table_sizes, "hashstring");

figure(3);
Uniformidade_1(hashcodes3, table_sizes, "djb2");

figure(4);
Uniformidade_1(hashcodes4, table_sizes, "sdbm");

%ii)
fprintf("\n");
Uniformidade_2(hashcodes1, "DJB31MA", table_sizes);
fprintf("\n");

Uniformidade_2(hashcodes2, "hashstring", table_sizes);
fprintf("\n");

Uniformidade_2(hashcodes3, "djb2", table_sizes);
fprintf("\n");

Uniformidade_2(hashcodes4, "sdbm", table_sizes);
fprintf("\n");
%b) e c)
fprintf("-------------------------Comparações das Funções de Hash-------------------------\n");

for i=1:3
    size = table_sizes(i);
    fprintf("-------------------------Tamanho da Hash Table - %d-------------------------\n", size);
    fprintf("%30s%20s%15s%15s\n", 'DJB31MA', 'hashstring', 'djb2', 'sdbm');
    fprintf("Colisões:%21d%20d%15d%15d\n", colisoes1(i), colisoes2(i), colisoes3(i), colisoes4(i));
    fprintf("Nº Máximo Atribuições:%8d%20d%15d%15d\n", max(atribuicoes1{i}), max(atribuicoes2{i}), max(atribuicoes3{i}), max(atribuicoes4{i}));
    fprintf("Tempo Execução:%15.3f%20.3f%15.3f%15.3f\n", tempos_execucao1(i), tempos_execucao2(i), tempos_execucao3(i), tempos_execucao4(i));
end


load("keysB.mat");

table_sizes = [5e5, 1e6, 2e6];
num_tables = length(table_sizes);

[hashcodes1, atribuicoes1, colisoes1, tempos_execucao1] = Ex02Aux("DJB31MA", keys, table_sizes, num_tables);
[hashcodes2, atribuicoes2, colisoes2, tempos_execucao2] = Ex02Aux("hashstring", keys, table_sizes, num_tables);
[hashcodes3, atribuicoes3, colisoes3, tempos_execucao3] = Ex02Aux("djb2", keys, table_sizes, num_tables);
[hashcodes4, atribuicoes4, colisoes4, tempos_execucao4] = Ex02Aux("sdbm", keys, table_sizes, num_tables);


figure(1);
Uniformidade_1(hashcodes1, table_sizes, "DJB31MA");

figure(2);
Uniformidade_1(hashcodes2, table_sizes, "hashstring");

figure(3);
Uniformidade_1(hashcodes3, table_sizes, "djb2");

figure(4);
Uniformidade_1(hashcodes4, table_sizes, "sdbm");

fprintf("\n");
Uniformidade_2(hashcodes1, "DJB31MA", table_sizes);

fprintf("\n");
Uniformidade_2(hashcodes2, "hashstring", table_sizes);

fprintf("\n");
Uniformidade_2(hashcodes3, "djb2", table_sizes);
fprintf("\n");

Uniformidade_2(hashcodes4, "sdbm", table_sizes);
fprintf("\n");
fprintf("-------------------------Comparações das Funções de Hash-------------------------\n");

for i=1:3
    size = table_sizes(i);
    fprintf("-------------------------Tamanho da Hash Table - %d-------------------------\n", size);
    fprintf("%30s%20s%15s%15s\n", 'DJB31MA', 'hashstring', 'djb2', 'sdbm');
    fprintf("Colisões:%21d%20d%15d%15d\n", colisoes1(i), colisoes2(i), colisoes3(i), colisoes4(i));
    fprintf("Nº Máximo Atribuições:%8d%20d%15d%15d\n", max(atribuicoes1{i}), max(atribuicoes2{i}), max(atribuicoes3{i}), max(atribuicoes4{i}));
    fprintf("Tempo Execução:%15.3f%20.3f%15.3f%15.3f\n", tempos_execucao1(i), tempos_execucao2(i), tempos_execucao3(i), tempos_execucao4(i));
end
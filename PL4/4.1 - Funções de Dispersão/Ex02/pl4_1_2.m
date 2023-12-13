load("keysA.mat");
table_sizes = [5e5, 1e6, 2e6];
num_tables = length(table_sizes);

[hashcodes1, atribuicoes1, colisoes1, tempos_execucao1] = Ex02Aux("DJB31MA", keys, table_sizes, num_tables);
[hashcodes2, atribuicoes2, colisoes2, tempos_execucao2] = Ex02Aux("hashstring", keys, table_sizes, num_tables);
[hashcodes3, atribuicoes3, colisoes3, tempos_execucao3] = Ex02Aux("djb2", keys, table_sizes, num_tables);
[hashcodes4, atribuicoes4, colisoes4, tempos_execucao4] = Ex02Aux("sdbm", keys, table_sizes, num_tables);

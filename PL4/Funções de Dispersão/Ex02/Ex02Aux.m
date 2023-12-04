function [hashcodes, atribuicoes, colisoes, tempos_execucao] = Ex02Aux(fun, keys, table_sizes, num_tables)

hashcodes = cell(num_tables, 1);
atribuicoes = cell(num_tables, 1);
colisoes = zeros(num_tables, 1);
tempos_execucao = zeros(num_tables, 1);
seed = randi(2^32 - 1);

for table_idx = 1:num_tables
    table_size = table_sizes(table_idx);
    hash_table = cell(1, table_size);

    hashcodes{table_idx} = zeros(1, length(keys)); 
    atribuicoes{table_idx} = zeros(1, table_size);

    tic;
    
    for key_idx = 1:length(keys)

        if strcmp("DJB31MA", fun) == 0
            hashcode = mod(DJB31MA(keys{key_idx}, seed), table_size) + 1;
        elseif strcmp("hashstring", fun) == 0
            hashcode = mod(hashstring(keys{key_idx}, table_size),table_size)+1;
        elseif strcmp("djb2", fun) == 0
            hashcode = mod(string2hash(keys{key_idx}, 'djb2'),table_size)+1;
        elseif strcmp("sdbm", fun) == 0
            hashcode = mod(string2hash(keys{key_idx}, 'sdbm'),table_size)+1;
        end
        hashcodes{table_idx}(key_idx) = hashcode;
        
        if isempty(hash_table{hashcode})
            hash_table{hashcode} = keys{key_idx};
        else
            if iscell(hash_table{hashcode})
                hash_table{hashcode}{end + 1} = keys{key_idx};
            else
                hash_table{hashcode} = {hash_table{hashcode}, keys{key_idx}};
                colisoes(table_idx) = colisoes(table_idx) + 1;
            end
        end
        
        atribuicoes{table_idx}(hashcode) = atribuicoes{table_idx}(hashcode) + 1;
    end
    tempos_execucao(table_idx) = toc;
end
end
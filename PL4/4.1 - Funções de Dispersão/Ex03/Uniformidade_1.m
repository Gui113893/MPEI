function Uniformidade_1(hashcodes, table_sizes, function_name)
    num_tables = length(table_sizes);

    for table_idx = 1:num_tables
        subplot(3, 1, table_idx);
        histogram(hashcodes{table_idx}, 100, 'Normalization', 'probability');
        title(['Histograma - ' function_name ' - Tamanho da Hash Table: ' num2str(table_sizes(table_idx))]);
        xlabel('Hashcode');
        ylabel('Probabilidade');
    end
end
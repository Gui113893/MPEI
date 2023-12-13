function Uniformidade_2(hashcodes, fun, sizes)

for i=1:3
    size = sizes(i);
    hashcodes_normalized = hashcodes{i} / size;

    moment_2 = 1/3;
    moment_5 = 1/6;
    moment_10 = 1/11;

    pratico_moment_2 = mean(hashcodes_normalized.^2);
    pratico_moment_5 = mean(hashcodes_normalized.^5);
    pratico_moment_10 = mean(hashcodes_normalized.^10);

    fprintf("------------------Distribuição da Função %s - Hash Table Tamanho:%d------------------\n", fun, size);
    fprintf('Momento 2 Teórico: %.4f, Momento 2 Prático: %.4f\n', moment_2, pratico_moment_2);
    fprintf('Momento 5 Teórico: %.4f, Momento 5 Prático: %.4f\n', moment_5, pratico_moment_5);
    fprintf('Momento 10 Teórico: %.4f, Momento 10 Prático: %.4f\n', moment_10, pratico_moment_10);
end
end
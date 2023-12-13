function [signatures, tempoMinHash] = minHash2(Set, k)
    % Esta função minHash aplica k funções dispersão utilizando o Método de Carter
    % and Wegman a cada conjunto de filmes de cada user e escolhe o mínimo
    % hashcode para colocar na matrix das assinaturas (signatures) a cada k
    % iteração
    %
    % Primeiro são inicializados os dados para as k funções dispersão
    % utilizando a função initHashFunctions que recebe como argumento
    % N (número base para a geração de número primos aleatórios)
    % k (número de funções dispersão desejadas)
    %
    % De seguida, por cada user (u), por cada j função dispersão, é atribuído
    % a signatures, o mínimo valor de hashcode quando j é aplicada ao
    % conjunto de filmes (films)
    
    N = 1e6;
    tic;
    hashFuns = initHashFunctions(N, k);
    Nu = length(Set);
    signatures = zeros(k, Nu);
    h = waitbar(0, 'Calculating MinHash');
    for u = 1:Nu
        waitbar(u/Nu, h);
        films = Set{u};
        for j = 1:k
            signatures(j, u) = carterMinHashFunction(hashFuns, j, films); 
        end
    end
    delete(h)
    tempoMinHash = toc;
end
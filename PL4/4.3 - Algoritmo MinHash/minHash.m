function [signatures, tempoMinHash] = minHash(films,Set,k)
    % Esta função minHash gera uma matrix dos índices dos filmes permutados
    % k vezes (perms) e, por cada utlizador u, por cada permutação j, vai
    % buscar os números dos filmes do utilizador que, neste caso,
    % coincidem com os índices (por isso não é preciso a criação de uma 
    % matriz shinglesXdocuments) e aplica-os na matriz das permutações,
    % guardando o menor valor dos encontrados na matriz de output (signatures)
    % na posição (j,u) 
    %
    % Ou seja, sendo perms a matriz dos índices permutados e Set o conjunto
    % de filmes por utilizador, basta percorrer por utilizador u do Set e 
    % por j permutação de k permutações
    %
    % Ex: 
    % for u=1:length(Set)
    %   for j=1:k
    %       signatures(j,u) = min(perms(j, Set{u}))
    %   end
    % end
    %

    signatures = zeros(k, length(Set));
    perms = zeros(k, length(films));
    for i = 1:k
        perms(i, :) = randperm(length(films));
    end
    h = waitbar(0, 'Calculating MinHash');
    tic;
    for u = 1:length(Set)
        waitbar(u/length(Set), h);
        for j = 1:k
            signatures(j,u) = min(perms(j, Set{u}));
        end
    end
    delete(h)
    tempoMinHash = toc;
end
udata = load('u.data');
u = udata(1:end, 1:2); clear udata;
Nu = length(unique(u(:,1)));
x = Nu;   %Número de utilizadores aleatórios
users = randperm(Nu, x);

Set = initFilmSet(u, users);
for k = [50, 100, 200]
    fprintf("=====================K = %d =====================\n", k);
    % minHash e minHash2 são 2 maneiras diferentes de resolver o problema
    % usando o método de minHash, uma por permutações e outra por funções
    % dispersão.
    % Fazer help {função} para saber mais pormenores ou ir diretamente ao 
    % ficheiro de cada função
    
    % Tempo médio da minHash aproximado = 1,80s
    filmes = unique(u(:,2));
    [signatures,tempoMinHash] = minHash(filmes, Set, k);
    
    % Tempo médio da minHash2 aproximado = 2,96s
    %[signatures, tempoMinHash] = minHash2(Set, k);
    
    J = zeros(length(users));
    h = waitbar(0, 'Calculating Distances');
    tic;
    for n1=1:length(users)
        waitbar(n1/length(users), h);
        for n2 = n1+1:length(users)
            c1 = signatures(:, n1);
            c2 = signatures(:, n2);

            J(n1, n2) = 1- sum(c1 == c2)/k;
        end
    end

    delete(h)
    tempoJaccard = toc;
    threshold = 0.4;
    [SimilarUsers, tempoSimilar, nSimilar] = calcSimilar(users, J, threshold);
    fprintf("Tempo de cálculo da distância: %.2fs\n", tempoJaccard);
    fprintf("Tempo de determinação das distâncias abaixo do threshold: %.4fs\n", tempoSimilar);
    fprintf("Número de pares de utilizadores com distâncias inferiores a %.2f: %d\n", threshold, nSimilar);
    for i = 1:nSimilar
        fprintf("UserID1: %3d | UserID2: %3d | Distância de Jaccard: %.3f\n", SimilarUsers(i, 1), SimilarUsers(i, 2), SimilarUsers(i, 3));
    end
    fprintf("================================================\n");
end





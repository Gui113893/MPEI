udata = load('u.data');
u = udata(1:end, 1:2); clear udata;
Nu = length(unique(u(:,1)));
x = Nu;   %Número de utilizadores aleatórios
users = randperm(Nu, x);

Set = initFilmSet(u, users);
matrix = makeMatrix(u, Set, users);
for k = [50, 100, 200]
    fprintf("=====================K = %d =====================\n", k);
    [signatures,tempoMinHash] = minHash(matrix, k);
    J = zeros(length(users));
    h = waitbar(0, 'Calculating Distances');
    tic;
    for n1=1:length(users)
        waitbar(n1/length(users), h);
        for n2=n1+1:length(users)
            J(n1,n2) = sum(signatures(:,n1) ~= signatures(:,n2))/k;
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





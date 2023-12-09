udata = load('u.data');
u = udata(1:end, 1:2); clear udata;
Nu = length(unique(u(:,1)));
x = Nu;   %Número de utilizadores aleatórios
users = randperm(Nu, x);


Set = initFilmSet(u, users);
[J, tempoJaccard] = calcJaccard(Set);
threshold = 0.4;
[SimilarUsers, tempoSimilar, nSimilar] = calcSimilar(users, J, threshold);
fprintf("Tempo de cálculo da distância: %.2fs\n", tempoJaccard);
fprintf("Tempo de determinação das distâncias abaixo do threshold: %.4fs\n", tempoSimilar);
fprintf("Número de pares de utilizadores com distâncias inferiores a %.2f: %d\n", threshold, nSimilar);
for i = 1:nSimilar
    fprintf("UserID1: %3d | UserID2: %3d | Distância de Jaccard: %.3f\n", SimilarUsers(i, 1), SimilarUsers(i, 2), SimilarUsers(i, 3));
end
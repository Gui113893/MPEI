udata = load('u.data');
u = udata(1:end, 1:2); clear udata;
Nu = length(unique(u(:,1)));
x = 100;   %Número de utilizadores aleatórios

users = randperm(Nu, x);

Set = initFilmSet(u, users);
[J, tempoJaccard] = calcJaccard(Set);
threshold = 0.6;
[SimilarUsers, tempoSimilar, nSimilar] = calcSimilar(users, J, threshold);










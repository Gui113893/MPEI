%Código base para deteção de pares similares

udata = load('u.data'); % Carrega o ficheiro dos dados dos filmes
%Fica apenas com as duas primeiras colunas
u = udata(1:end, 1:2); clear udata;

%Lista de utilizadores
users = unique(u(:,1));     % Extrai os IDs dos utilizadores
Nu = length(users);         % Número de utilizadores

%Constrói a lista de filmes para cada utilizador
Set = cell(Nu, 1);          % Usa células
for n = 1:Nu    % Para cada utilizador
    %Obtém os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa células porque utilizador tem um número
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end

%% Calcula a distância de Jaccard entre todos os pares pela definição

J = zeros(Nu, Nu); % array para guardar distâncias
h = waitbar(0, 'Calculating');
tic;
for n1 = 1:Nu
    waitbar(n1/Nu, h);
    for n2 = n1+1:Nu
        %% Adicionar código aqui
        films1 = Set{n1};  % Conjunto dos filmes do user n1
        films2 = Set{n2};  % Conjunto dos filmes do user n2
        
        % Distãncia entre os conjuntos de filmes de cada par n1, n2
        J(n1,n2) = 1 - (length(intersect(films1, films2))/length(union(films1, films2)));
    end
end
delete(h)
tempoJaccard = toc;
save('Jaccard_1.mat', 'J');

%% Com base na distância, determina para com distância inferior a um limiar pré-definido

threshold = 0.4; % limiar de decisão

% Array para guardar pares similares (user1, user2, distância)
SimilarUsers = zeros(1,3);
k = 1;
tic;
for n1 = 1:Nu
    for n2 = n1+1:Nu
       if J(n1,n2) < threshold
           SimilarUsers(k, :) = [users(n1) users(n2) J(n1,n2)];
           k = k+1;
       end
    end
end
tempoSimilar = toc;
fprintf("Tempo de cálculo da distância: %.2fs\n", tempoJaccard);
fprintf("Tempo de determinação das distâncias abaixo do threshold: %.4fs\n", tempoSimilar);
fprintf("1) Número de pares de utilizadores com distâncias inferiores a %.2f: %d\n", threshold, k-1);
fprintf("2)\n");
for i = 1:k-1 
    fprintf("UserID1: %3d | UserID2: %3d | Distância de Jaccard: %.3f\n", SimilarUsers(i, 1), SimilarUsers(i, 2), SimilarUsers(i, 3));
end








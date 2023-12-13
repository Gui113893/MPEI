function [SimilarUsers, tempoSimilar, nSimilar] = calcSimilar(users, J, threshold)  
    SimilarUsers = zeros(1,3);
    Nu = length(users);
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
    nSimilar = k-1;
end
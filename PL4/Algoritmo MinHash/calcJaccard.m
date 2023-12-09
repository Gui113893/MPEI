function [J, tempoJaccard] = calcJaccard(Set)
    Nu = length(Set);
    J = zeros(Nu, Nu);
    h = waitbar(0, 'Calculating');
    tic;
    for n1 = 1:Nu
        waitbar(n1/Nu, h);
        for n2 = n1+1:Nu
            films1 = Set{n1};  
            films2 = Set{n2};  
            J(n1,n2) = 1 - (length(intersect(films1, films2))/length(union(films1, films2)));
        end
    end
    delete(h)
    tempoJaccard = toc;
end
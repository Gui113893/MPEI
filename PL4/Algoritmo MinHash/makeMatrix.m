function matrix = makeMatrix(u, Set, users)
    shingles = unique(u(:,2));   %os shingles vão ser os filmes
    matrix = zeros(length(shingles), length(users));
    h = waitbar(0, 'Calculating Matrix (Shingles x Documents)');
    for i = 1:length(shingles)
        waitbar(i/length(shingles), h);
        for j=1:length(users)
            matrix(i, j) = any(Set{j} == shingles(i)); %verifica se o user j deu rating ao filme i
        end
    end
    delete(h)
end
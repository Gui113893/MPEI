function [signatures, tempoMinHash] = minHash(matrix, k)
    signatures = zeros(k, width(matrix));
    % Gera-se a matriz das permutações dos índices
    perms = zeros(k, height(matrix));
    for i = 1:k
        perms(i, :) = randperm(height(matrix));
    end
    h = waitbar(0, 'Calculating MinHash');
    tic;
    % Por cada user de matrix
    for i = 1:width(matrix)
        waitbar(i/width(matrix), h);
        % Por cada permutação dos índices
        for j = 1:k
            % Encontram-se os índices onde o user tem 1
            indx = find(matrix(:, i));
            if ~isempty(indx)
                % Põe-se nas assinaturas, na posição do user, o menor
                % índice na matriz das permutações
                signatures(j,i) = min(perms(j, indx));
            else
                signatures(j,i) = 0;
            end
        end
    end
    delete(h)
    tempoMinHash = toc;
end
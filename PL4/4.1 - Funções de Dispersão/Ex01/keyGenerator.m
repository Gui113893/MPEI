function [keys] = keyGenerator(N, iMin, iMax, usableChars, probs)
    if nargin < 5
        probs = ones(length(usableChars),1)*(1/length(usableChars));
    end
        
    keys = cell(N,1);
    sizes = round(rand(N, 1)*(iMax - iMin) + iMin);
    while 1
        for i=1:N
            key_size = sizes(i);
            char_indices = randsample(1:length(usableChars), key_size, true, probs);
            key = usableChars(char_indices)';
            keys{i} = key;
        end
        if length(unique(keys)) == length(keys)
            break
        end
    end
end
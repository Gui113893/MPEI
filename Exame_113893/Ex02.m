%% a)
n = 500;
k = 4;

ntotal = length(list);   %938
nAdao = sum(list == "Adão");  %1

B = initBloomFilter(list, k, n);

target = 'Adão';

out = mod(kHashValues(target,k), n)+1;
nAdaoFilter = min(B(out));   %3

%% b)
npessoas = zeros(1, length(extra));
for i = 1:length(extra)
    target = extra{i};
    out = mod(kHashValues(target,k), n)+1;
    npessoas(i) = min(B(out));
end

prob0 = sum(npessoas == 0) / length(extra);  
prob1 = sum(npessoas == 1) / length(extra);  
prob2 = sum(npessoas == 2) / length(extra);  
prob3mais = sum(npessoas >= 3) / length(extra);

fprintf("prob de 0 = %.5f\n", prob0);
fprintf("prob de 1 = %.5f\n", prob1);
fprintf("prob de 2 = %.5f\n", prob2);
fprintf("prob de 3 ou mais = %.5f\n", prob3mais);















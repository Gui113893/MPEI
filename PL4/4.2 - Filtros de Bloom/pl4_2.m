filename = 'wordlist-preao-20201103.txt';
fileID = fopen(filename, 'r');
wordCellArray = textscan(fileID, '%s');
fclose(fileID);

%1)
U1 = wordCellArray{1}(1:1000);
n = 8000;
k = 3;
B = initBloom(n);
B = insertBloom(B, k, U1);

%2)
booleanArray = zeros(length(U1), 1);
for i=1:length(U1)
    x = U1{i};
    if isElementInC(x, B, k) 
        booleanArray(i) = 1;
    end
end
if sum(booleanArray) == length(U1)
    fprintf("Não há falsos Negativos\n");
else 
    fprintf("Há falsos negativos\n");
end

%3)
U2 = wordCellArray{1}(1001:11000);
booleanArray = zeros(length(U2), 1);
for i=1:length(U2)
    x = U2{i};
    if isElementInC(x, B, k) 
        booleanArray(i) = 1;
    end
end
falsePositive = (sum(booleanArray)/length(booleanArray)) * 100;
fprintf("Percentagem de Falsos Positivos: %.2f%%\n", falsePositive);

%4)
m = length(U1);
a = (1 - 1/length(B))^m;
Pfp = ((1-a^k)^k)*100; 
fprintf("Percentagem Teórica de Falsos Positivos: %.2f%%\n", Pfp);

%5)
PfpArray = zeros(1, 7);
for k=1:7
    B = initBloom(n);
    B = insertBloom(B, k+3, U1);
    booleanArray = zeros(length(U2), 1);
    for i=1:length(U2)
        x = U2{i};
        if isElementInC(x, B, k+3) 
            booleanArray(i) = 1;
        end
    end
    PfpArray(k) = (sum(booleanArray)/length(booleanArray))*100;
end
figure(1);
hold on;
plot(4:10, PfpArray, "b");
m = length(U1);
a = (1 - 1/length(B))^m;
k = 4:10;
PfpTheoryArray = ((1-a.^k).^k).*100;
plot(4:10, PfpTheoryArray, "g");
legend('Prático', 'Teórico');
xlabel('k Funções Dispersão');
ylabel('Falsos Positivos (%)');
hold off;
otimo = find(PfpArray == min(PfpArray)) + 3;
fprintf("Na prática, o valor ótimo de k seria: %d\n", otimo);
otimoTheory = (0.693*n)/m;
fprintf("Na teoria, o valor ótimo de k seria: %d\n", round(otimoTheory));
%Se o U2 tiver mais valores, o valor ótimo de k prático vai tendendo para o
%valor teórico


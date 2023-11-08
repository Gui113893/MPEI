%a)
%Matriz H das Hiperligações
H = [0, 0, 0, 0, 1/3, 0;
     1, 0, 0, 0, 1/3, 0;
     0, 1/2, 0, 1, 0, 0;
     0, 0, 1, 0, 0, 0;
     0, 1/2, 0, 0, 0, 0;
     0, 0, 0, 0, 1/3, 0];
r = zeros(6, 11);
r0 = [1/6; 1/6; 1/6; 1/6; 1/6; 1/6];
r(:,1) = r0;
r(:,2) = H * r0;

for i=2:10
    r(:, i+1) = H * r(:, i);
end

disp("a) PageRank de cada página ao fim de 10 iterações:");
disp(r(:,11)); %Maior pagerank é o do C com 0.3315


%b) SpiderTrap está no par CD pois do C só é possível ir para o D e do D só
%é possível ir para o C ficando em loop (spider trap)
%DeadEnd é a página F pois, uma vez chegando nela, não se pode sair da
%mesma


%c)
%Matriz H corrigida para resolver problemas de DeadEnd
H = [0, 0, 0, 0, 1/3, 1/6;
     1, 0, 0, 0, 1/3, 1/6;
     0, 1/2, 0, 1, 0, 1/6;
     0, 0, 1, 0, 0, 1/6;
     0, 1/2, 0, 0, 0, 1/6;
     0, 0, 0, 0, 1/3, 1/6];  %Coluna de F com probabilidade 1/n para corrigir DeadEnd
r = zeros(6, 11);
r0 = [1/6; 1/6; 1/6; 1/6; 1/6; 1/6];
r(:,1) = r0;
r(:,2) = H * r0;

for i=2:10
    r(:, i+1) = H * r(:, i);
end

disp("c) PageRank de cada página ao fim de 10 iterações (DeadEnd corrigido):");
disp(r(:,11));

%d)
B = 0.8;
H = B*H + (1-B)*(1/6*ones(6, 6)); %H = 0.8H + o.2[1/6]6x6 para corrigir SpiderTrap

r = zeros(6, 11);
r0 = [1/6; 1/6; 1/6; 1/6; 1/6; 1/6];
r(:,1) = r0;
r(:,2) = H * r0;

for i=2:10
    r(:, i+1) = H * r(:, i);
end

disp("d) PageRank de cada página ao fim de 10 iterações (Tudo corrigido):");
disp(r(:,11));

%e)
r = zeros(6, 11);
r0 = [1/6; 1/6; 1/6; 1/6; 1/6; 1/6];
r(:, 1) = r0;
r(:, 2) = H * r0;
max_diff = 0;

%Limite de tolerância
limit = 10^(-4);
for i = 2:10
    r(:, i+1) = H * r(:, i);
    % Verificar a diferença entre  2 iterações consecutivas
    max_diff = abs(r(:, i) - r(:, i-1));
    % Se a diferença for maior que o limite, interrompe o loop
    if max_diff > limit
        disp(['Diferença maior que limite alcançada após ', num2str(i), ' iterações.'])
        break;
    end
end

disp("e) PageRank de cada página:");
disp(r(:, i));





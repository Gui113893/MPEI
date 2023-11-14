%a)
T = [0.7, 0.2, 0.3; 0.2, 0.3, 0.3; 0.1, 0.5, 0.4];
disp("a) T = ")
disp(T);

%b)
X1 = [1; 0; 0]; %Primeiro dia é de sol
X2 = T*X1; %Probabilidade do segundo dia
X3 = X2(1,1) * T(1,1);
disp("b)")
fprintf("Estar sol no segundo dia: %.2f%%\n", X2(1,1)*100);
fprintf("Estar sol no terceiro dia: %.2f%%\n", X3*100);

%c)
%C3 - Chover no terceiro dia  C2 - Chover no segundo dia *C3 - Não chover no terceiro dia *C2 - Não
%chover no segundo dia
%P(*C3 /\ *C2) = P(*(C3 \/ C2)) = 1 - P(C3 \/ C2)
%P(C3 \/ C2) = P(C3) + P(C2) - P(C3 /\ C2)
%P(C3 /\ C2) = P(C3|C2) * P(C2)
X3 = T*X2; %Probabilidade do terceiro dia
PC2 = X2(3,1);
PC3 = X3(3,1);
PC2e3 = T(3,3) * PC2;
PC2ou3 = PC3 + PC2 - PC2e3;
Pfinal = 1 - PC2ou3;
disp("c) Probabilidade de não chover nem no segundo dia nem no terceiro = ")
disp(Pfinal);

%d)
ndias = 31; %janeiro
M = zeros(3, ndias);
M(:,1) = X1; %Primeiro dia é de sol

for i=2:31
    M(:,i) = T^(i-1) * X1;
end

mediaSol = sum(M(1, :)); 
mediaNuvens = sum(M(2, :)); 
mediaChuva = sum(M(3, :));

disp("d) Nº médio de dias de sol");
disp(mediaSol);
disp("Nº médio de dias de nuvens");
disp(mediaNuvens);
disp("Nº médio de dias de chuva");
disp(mediaChuva);

%e)

X1 = [0; 0; 1];
M_e = zeros(3, ndias);
M_e(:,1) = X1; %Primeiro dia é de chuva

for i=2:31
    M_e(:,i) = T^(i-1) * X1;
end

mediaSol_e = sum(M_e(1, :)); 
mediaNuvens_e = sum(M_e(2, :)); 
mediaChuva_e = sum(M_e(3, :));

disp("e) Nº médio de dias de sol");
disp(mediaSol_e);
disp("Nº médio de dias de nuvens");
disp(mediaNuvens_e);
disp("Nº médio de dias de chuva");
disp(mediaChuva_e);

%f)

probPessoa = [0.1; 0.3; 0.5];
medias = [mediaSol; mediaNuvens; mediaChuva];
medias_e = [mediaSol_e; mediaNuvens_e; mediaChuva_e];

%Se o primeiro dia foi sol
mediaDoresMes1 = sum(medias.*probPessoa);

%Se o primeiro dia  foi chuva
mediaDoresMes2 = sum(medias_e.*probPessoa);

disp("f) Nº Esperado de Dores quando o primeiro dia é de Sol");
disp(mediaDoresMes1);
disp("Nº Esperado de Dores quando o primeiro dia é de Chuva");
disp(mediaDoresMes2);






















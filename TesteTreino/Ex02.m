%a)
N = 100; %São 100 páginas pois a matriz L é uma matriz 100x100
disp("Páginas DeadEnd");
for i=1:100
    if L(:,i) == 0
        disp(i);
    end
end
%Alternativa a achar os dead-ends
%S=sum(L);
%disp("Os dead-dens são:")
%find(S==0)
%b)
H = zeros(100,100);
for i=1:100
    nLinks = sum(L(:,i));
    if nLinks ~= 0
        prob = 1/nLinks;
        for j=1:100
            if L(j,i) == 1
                H(j,i) = prob;
            end
        end
    end
end
disp("b) H = ");
disp(H);

%c)
B = 0.85;
A = B*H + (1-B)*(1/100*ones(100, 100));
disp("c) A = ");
disp(A);

%d)
r0 = ones(100, 1)/100;
r1 = H*r0;
disp("d) PageRank de todas as páginas");
disp(r1);

%e)
firstv=0;
first=0;
for i=1:100
    if r1(i) > firstv
        firstv = r1(i);
        first=i;
    end
end
r1(first)=0;
secondV = 0;
second = 0;

for i=1:100
    if r1(i) > secondV
        secondV = r1(i);
        second=i;
    end
end
r1(second) = 0;

thirdV = 0;
third = 0;

for i=1:100
    if r1(i) > thirdV
        thirdV = r1(i);
        third=i;
    end
end
r1(third) = 0;
disp("e) Maiores pageranks e respetivos valores");
fprintf("%d - %.4f of Pagerank\n", first, firstv);
fprintf("%d - %.4f of Pagerank\n", second, secondV);
fprintf("%d - %.4f of Pagerank\n", third, thirdV);













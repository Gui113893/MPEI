%2 - 0.3754
p = 0.5;
k = 2;
n = 3;
prob = nchoosek(n, k) * p^k * (1-p)^(n-k); %0.3750

disp(prob);

%3- 0.1524
k = 6;
n = 15;
prob = nchoosek(n, k) * p^k * (1-p)^(n-k);

disp(prob); %0.1527







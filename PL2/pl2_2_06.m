%a)
p = 1/1000;
k = 7;
n = 8000;

binomial = nchoosek(n, k) * (p)^k * (1-p)^(n - k);
fprintf("Binomial = %.7f\n", binomial);

%b)
lambda = n*p;
poisson = ((lambda)^k * exp(-lambda))/factorial(k);
fprintf("Poisson = %.7f\n", poisson);


p = logspace(-3, log10(1/2), 100);

aviao1 = nchoosek(2, 2) .* (p).^2 .* (1 - p).^(2 - 2);

aviao2 = nchoosek(4, 3) .* (p).^3 .* (1 - p).^(4 - 3) + nchoosek(4, 4) .* (p).^4 .* (1 - p).^(4 - 4) ;

figure(1);
plot(p, aviao1, p , aviao2);
legend("Avião 1 (2 motores)", "Avião 2 (4 motores)");
grid on;








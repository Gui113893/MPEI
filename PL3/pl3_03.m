T = rand(20);

T = T ./ sum(T);

%a)

sum(T)


%b)

X0 = zeros(20,1);
X0(1,1) = 1;

X2 = T^2 * X0;
X5 = T^5 * X0;
X10 = T^10 * X0;
X100 = T^100 * X0;

PX2 = X2(20, 1)*100;
PX5 = X5(20, 1)*100;
PX10 = X10(20, 1)*100;
PX100 = X100(20, 1)*100;

fprintf("Probabilidade de estar no estado 20:\n");
fprintf("  2 Transições: %.5f%%\n  5 Transições: %.5f%%\n 10 Transições: %.5f%%\n100 Transições: %.5f%%\n", PX2, PX5, PX10, PX100);



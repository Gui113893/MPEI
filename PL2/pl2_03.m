N = 1e5;

%a)
T = 1000;
num_keys = 10;

hash_positions = randi(T, num_keys, N);
collisions = sum(diff(sort(hash_positions, 1), 1, 1) == 0) >= 1;
probSimulacaoA = sum(collisions)/N;

disp(probSimulacaoA);

%b)
probSimulacaoB = zeros(1, 9);
for i=2:9
    hash_positions = randi(T, i, N);
    collisions = sum(diff(sort(hash_positions, 1), 1, 1) == 0) >= 1;
    probSimulacaoB(1, i) = sum(collisions)/N;
end
figure(1);
plot(2:10, probSimulacaoB);

%c)
num_keys = 50;
probSimulacaoC = zeros(1, 10);
T = 100:100:1000;

for i=1:10
    hash_positions = randi(T(1, i), num_keys, N);
    no_collisions = sum(diff(sort(hash_positions, 1), 1, 1) == 0) == 0;
    probSimulacaoC(1, i) = sum(no_collisions)/N;
end
figure(2);
plot(T, probSimulacaoC);




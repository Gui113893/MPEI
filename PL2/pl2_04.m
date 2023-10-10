N = 1e5;
%a)

num_days = 365;

for i=1:1:300 
    birthdays = randi(num_days, i, N);
    same_birthday = sum(diff(sort(birthdays, 1), 1, 1) == 0) >= 2;
    probSimulacaoA = sum(same_birthday) / N;
    if probSimulacaoA > 0.5
        n = i;
        break
    end
end
disp(n); %36

%b)

for i=1:1:300
    birthdays = randi(num_days, i, N);
    same_birthday = sum(diff(sort(birthdays, 1), 1, 1) == 0) >= 2;
    probSimulacaoB = sum(same_birthday) / N;
    if probSimulacaoB > 0.9
        n = i;
        break
    end
end
disp(n); %54





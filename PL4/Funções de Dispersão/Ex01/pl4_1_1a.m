%a)
N = 1e5;
upperCase = char('A':'Z');
lowerCase = char('a':'z');
usableChars = [upperCase, lowerCase]';
iMin = 6;
iMax = 20;
[keys] = keyGenerator(N, iMin, iMax, usableChars);

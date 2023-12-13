%b)
N = 1e5;
usableChars = char('a':'z')';
iMin = 6;
iMax = 20;
probs = load("prob_pt.txt");
[keys] = keyGenerator(N, iMin, iMax, usableChars, probs);
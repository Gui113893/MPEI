k = 4;
lista = {'Mercedes-AMG'	'W12E'	'Mercedes'	'M12 E'	'Petronas'	'Reino Unido'
'Red Bull Racing'	'RB16B'	'Honda'	'RA621H'	'Red Bull'	'Reino Unido'
'McLaren F1 Team'	'MCL35M'	'Mercedes'	'M12 E'	'Vários'	'Reino Unido'
'Scuderia AlphaTauri'	'AT02'	'Honda'	'RA621H'	'Vários'	'Itália'};
signatures = zeros(k, 4);
for nhf = 1:k
    for i = 1:4
        hashcodes = zeros(1, 6);
        for j = 1:6
            element = lista{i, j};
            hashcodes(j) = hf24(element,nhf);
        end
        signatures(nhf, i) = min(hashcodes);
    end
end


J = zeros(4);
for n1 = 1:4
    for n2 = n1+1:4
        c1 = signatures(:, n1);
        c2 = signatures(:, n2);

        J(n1, n2) = sum(c1 ~= c2)/k;
    end
end

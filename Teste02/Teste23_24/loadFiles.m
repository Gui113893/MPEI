% Load data
rest = readcell('restaurantes.txt', 'Delimiter', '\t');
udata = load('utilizadores.data');
u = udata(1:end, [1, 2, 4]); clear udata;
users = unique(u(:,1)); 

Nu = length(users);       
Set = cell(Nu, 1);        
for n = 1:Nu  
    Set{n} = [Set{n} u((u(:,1) == users(n)),2)];
end
userSignatures = minHash(Set); % for option 2
[dishesSignatures, hashFuns] = minHashDish(rest); %for option 3
restSignatures = minHashRestaurant(rest); %for option 4
[B, hashFunsBloom] = initBloomFilter(u); %for option 5


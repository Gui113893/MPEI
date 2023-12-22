% Load data
rest = readcell('restaurantes.txt', 'Delimiter', '\t');
udata = load('turistas1.data');
u = udata(1:end, 1:2); clear udata;
users = unique(u(:,1)); 

Nu = length(users);       
Set = cell(Nu, 1);        
for n = 1:Nu  
    Set{n} = [Set{n} u(u(:,1) == users(n),2)];
end
signatures = minHash(Set);
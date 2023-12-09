function Set = initFilmSet(u, users)  
    Nu = length(users);       

    Set = cell(Nu, 1);        
    for n = 1:Nu  
        Set{n} = [Set{n} u(u(:,1) == users(n),2)];
    end
end
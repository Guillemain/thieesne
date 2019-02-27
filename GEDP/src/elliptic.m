function u = elliptic(coord,elt3,elt4,dirichlet,neuman,g,u_d,fun)
fun_f = @(x)fun(x)
n = size(coord,1);
A = zeros(n);

%% Gestion Triangle :
for i = 1:size(elt3,1)
   p = coord(elt3(i,:),:);
   A_loc = raideur_loc(p(1,:),p(2,:),p(3,:));
   for k = 1:3
       for l = 1:3
           A(elt3(i,k),elt3(i,l)) = A_loc(k,l) + A(elt3(i,k),elt3(i,l));
       end
   end  
end
disp('Gestion Triangle');
%% Gestion Quadrangle :
for i = 1:size(elt4,1)
   p = coord(elt4(i,:),:);
   A_loc = quadrangle(p(1,:),p(2,:),p(3,:),p(4,:));
   for k = 1:4
       for l = 1:4
           A(elt4(i,k),elt4(i,l)) = A_loc(k,l) + A(elt4(i,k),elt4(i,l));
       end
   end  
end
disp('Gestion Quadrangle');
%% Creation du second membre :
% Parcours des triangles
b = zeros(n,1);
for i = 1:size(elt3,1)
    p = coord(elt3(i,:),:);
    B_loc = b_loc(p(1,:),p(2,:),p(3,:),fun_f);
    for k = 1:3
       b(elt3(i,k)) = b(elt3(i,k)) + B_loc(k);
    end
end
% Parcours des quadrangles
for i = 1:size(elt4,1)
    p = coord(elt4(i,:),:);
    B_loc = b_loc_q(p(1,:),p(2,:),p(3,:),p(4,:),fun_f);
    for k = 1:4
       b(elt4(i,k)) = b(elt4(i,k)) + B_loc(k);
    end
end
disp('Second membre fait');
%% Conditions de Dirichlet
U = zeros(size(b,1),1);
U(dirichlet) = u_d(coord(dirichlet));
for i = 1:n
    b(i) = b(i) + U'*A(i,:)';
end
disp('Conditions de Dirichlet faites');
%% Conditions de Neuman
disp('so far so good');
G = g((coord(neuman(:,1),:) + coord(neuman(:,2),:))/2);
for i = size(neuman,1)
    distance  = norm((coord(neuman(i,1),:) - coord(neuman(i,2),:)));
    b(neuman(i,1)) = G(i)*distance;
    b(neuman(i,2)) = G(i)*distance;
end
disp('Conditions de Neuman faites');
%% Resolution
disp('Resolution en cours...');
A(:,dirichlet) = [];
A(dirichlet,:) = [];
b(dirichlet) =[];
u = A\b;

%% On remet les points qu'on avait retirés
dirichelt = sort(dirichlet); % Pour pas faire nimporte quoi.
for i = dirichelt'
    u = [u(1:i-1); u_d(coord(i)); u(i:end)];
end
disp('Fin en ');

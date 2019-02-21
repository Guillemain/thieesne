n = 5;
[coord,elt3,~,dirichlet,~] = maillage_carre(n);

%% Creation de la matrice A. 
%  

A = zeros(size(coord,1));

for i = 1:size(elt3,1)
   p = coord(elt3(i,:),:);
   A_loc = raideur_loc(p(1,:),p(2,:),p(3,:));
   for k = 1:3
       for l = 1:3
           A(elt3(i,k),elt3(i,l)) = A_loc(k,l) + A(elt3(i,k),elt3(i,l));
       end
   end  
end

%% Creation du second membre :
% 

% Initialisation de b simple
b = zeros(size(coord,1),1);
for i = 1:size(elt3,1)
    p = coord(elt3(i,:),:);
    B_loc = b_loc(p(1,:),p(2,:),p(3,:));
    for k = 1:3
       b(elt3(i,k)) = b(elt3(i,k)) + B_loc(k);
    end
end



% U = zeros(size(b));
% U(dirichlet) = u_d(coord(dirichlet));
% % Condition de Dirichlet
% for i = 1:n
%     b(i) = b(i) + U'*A(i,:)';
% end

%%

u = A\b;

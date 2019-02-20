n = 20;
[coord,elt3,~,~,~] = maillage_carre(n);
%% Creation de la matrice A. 
%  

A = zeros(n);

for i = 1:n
   p = coord(elt3(i,:),:);
   A_loc = raideur_loc(p(1,:),p(2,:),p(3,:));
   for k = 1:3
       for l = 1:3
           A(elt3(i,k),elt3(i,l)) = A_loc(k,l);
       end
   end  
end

%% Creation du second membre :
%




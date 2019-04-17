function C3D = surface_interpolante(Grille,t,s)
%Fonction d'interpolation de surface, paramétré par t.
n = size(Grille,1);
m = size(Grille,2);
T = linspace(0,1,n);
S = linspace(0,1,m);

lenT = length(t);
lenS = length(s);

C3D = zeros(lenS,lenT,3);
for i = 1:lenS
    for j = 1:lenT %% Première interpolation
        for k = 1:3
           C3D(:,:,k) = C3D + Grille(i,j,k).*ones(lenS,lenT).*Lagrange_coef(T,j,t);
        end
    end
end

end

function Li = Lagrange_coef(T,i,x)
    Li = [1];
    A = 1:length(T);
    A(i) =[];
    for k = A
        Li = Li.*(x-T(k))/(T(i)-T(k));
    end
end
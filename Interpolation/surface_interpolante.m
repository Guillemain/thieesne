function C3D = surface_interpolante(Grille,lenT,lenS)
%Fonction d'interpolation de surface, paramétré par t et s.
n = size(Grille,1);
m = size(Grille,2);

T = linspace(-1,1,lenT);
S = linspace(-1,1,lenS);

Si = cos((2*(0:n-1)+1)*pi/(2*n)); 
Ti = cos((2*(0:m-1)+1)*pi/(2*m));


C3D = zeros(lenS,lenT,3);

% C'est un exo bonus, je suis dans la légitimité de blasphèmer mon MATLAB.
% En plus c'est parrallèlisable.
% D'abord.
for s = 1:lenS
    for t = 1:lenT
        for i = 1:n
            LS = Lagrange_coef(Si,i,S(s));
            for j = 1:m
                LT = Lagrange_coef(Ti,j,T(t));
                C3D(s,t,:) = C3D(s,t,:) + Grille(i,j,:).*LT.*LS;
            end
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
function A = calcul_A(N,alpha,beta,gamma)
UN = ones(N,1);
D = spdiags([UN -2*UN UN], -1:1, N, N);
D(N,1) = 1;
D(1,N) = 1;
A = speye(N,N) + gamma*(alpha*D - beta*(D')*D);

end
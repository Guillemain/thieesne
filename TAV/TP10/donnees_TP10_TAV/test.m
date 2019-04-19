n = 10;
g = ones(n,1);
A = spdiags([g -2*g g], -1:1, n, n)
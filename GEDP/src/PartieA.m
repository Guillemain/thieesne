%% Partie A.1
n = 10
[coord,elt3,elt4,dirichlet,neumann] = maillage_carre(n);
fun_g = @(x)g(x);
fun_u_d = @(x)u_d(x);
fun_f = @(x)f(x);
tic
u = elliptic(coord, elt3, elt4, dirichlet, neum, fun_g, fun_u_d, fun_f);
toc
%% Partie A.2

coord = load('coordinates.dat');
dirichlet = load('dirichlet.dat');
elt3 = load('elements3.dat');
elt4 = load('elements4.dat');
neumann = load('neumannn.dat');

fun_g = @(x)g(x);
fun_u_d = @(x)u_d(x);
fun_f = @(x)f(x);
tic
u = elliptic(coord, elt3, elt4, dirichlet, neum, fun_g, fun_u_d, fun_f);
toc
%% Rendu Graphique
show(elt3,elt4,coord,u);
%% Partie A.3
n = 40;
[coord,elt3,elt4,dirichlet,neumann] = maillage_carre(n);
fun_g = @(x)g(x);
fun_u_d = @(x)u_d(x);
fun_f = @(x)fsin(x);

tic
u = elliptic(coord, elt3, elt4, dirichlet, neum, fun_g, fun_u_d, fun_f);
toc

%Analyse resultats
figure(1)
show(elt3,elt4,coord,u);
figure(2)
solution_reel = fsin_sol(coord);
show(elt3,elt4,coord, solution_reel);

norm(solution_reel-u)/sqrt(length(solution_reel));

%% Tracer le graphique
erreur = [];
fun_g = @(x)g(x);
fun_u_d = @(x)u_d(x);
fun_f = @(x)fsin(x);
for n = 5:5:40
    [coord,elt3,elt4,dirichlet,neumann] = maillage_carre(n);
    u = elliptic(coord, elt3, elt4, dirichlet, neum, fun_g, fun_u_d, fun_f);
    solution_reel = fsin_sol(coord);
    erreur = [erreur norm(solution_reel-u)/sqrt(length(solution_reel))];
end

loglog(5:5:40,erreur)


N=20;

% u = (1,3,5,...)
u = 1:2:N

% v = (-1,3,-5,...)
% Partendo da u basta moltiplicare la componente i per (-1)^i
% Creo quindi un vettore formato in questo modo:
% (-1, 1, -1, 1, ... ) 
v = (u.*(-1).^(1:length(u)))'

% w = (-1, 3^2, -5^3, 7^4, ...) con al più sqrt(N) elementi
m = floor(sqrt(N));
% Due modi:
%   partire da v
w = v(1:m)'.^(1:m)
%   partire da u
w = (-u(1:m)).^(1:m)

% Z = [ 1 2 3 4 5 ... N-2;
%       3 4 5 6 7 ... N   ]
Z = [1:N-2;3:N];

% Prendere tutti gli elementi di entrambe le righe
z = Z(:)

% Remainder: i coefficienti per e^x sono 1/n!
c = 1./factorial(0:N-1)

% Remainder: i coefficienti per log(x+1) sono ((-1)^(n-1))/n
d = [0,((-1).^(0:N-2))./(1:N-1)]
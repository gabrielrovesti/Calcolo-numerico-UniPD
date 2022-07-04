N = 10;
u = 1:2:N;
v = 2:2:N-1;

% Combinare le diagonali
% [ 1 0 ...    0
%   0 2 0 ...   0
%   .............
%   0 ...       N ]
%
% [ 0 ...       0
%   2 0 ...     0
%   0 3 0 ...   0
%   .............
%   0 ...     N 0 ]
%
% [ 0 2 0 ...   0
%   0 0 3 0 ... 0
%   .............
%   0 ...       N
%   0 ...       0 ]

A = diag(u)+diag(v,1)+diag(v,-1)

% Basta fare il prodotto riga per colonna sfruttando u
u = 1:N;
B = u'*u

% La somma tra un vettore colonna v di dimensione n e uno riga w di dimensione
% ha come risultato una matrice nxm con la somma dove il risultato r in
% posizione (i,j) corrisponde a
%                       r(i,j) = v(i) + w(j)
% https://it.mathworks.com/help/matlab/ref/plus.html
C = (-1).^(u'+u)

% Genero un vettore (-1,-1, ...) e applico l'elevamento a potenza punto a
% punto con (1,2,3,...)
% Infine, genero la matrice sfruttando la moltiplicazione riga per colonna
C1 = (-ones(1,N)).^(1:N);
C1 = C1 .* C1'

% Sfruttando la definizione a blocchi
%       [   D1      D2
%           D3      D4   ]
% Noto che  D1 = u' + u, 
%           D2 = u - u',
%           D3 = u' - u,
%           D4 = D1
D = [ u'+u,   u-u';
      u'-u,   u'+u  ]
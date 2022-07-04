N = 5;
u = 1:2:N;
v = 2:2:N-1;

% Combinare le diagonali
% [ 1 0 ...    0
%   0 3 0 ...   0
%   .............
%   0 ...       N ]
%
% [ 0 ...       0
%   2 0 ...     0
%   0 4 0 ...   0
%   .............
%   0 ...     N 0 ]
%
% [ 0 2 0 ...   0
%   0 0 4 0 ... 0
%   .............
%   0 ...       N
%   0 ...       0 ]

% A =
%   [ 1 2 0 ...   0
%     2 3 4 0 ... 0
%     0 4 5 0 .....
%     .............
%     0 ...       N
%     0 ...    N N+1 ]
A = diag(u) + diag(v, 1) + diag(v, -1)

% B = 
%   [ 1  2  3 ... N  
%     2  4  6 ... 2N
%     3  6  9 ... 3N
%     .............
%     N  2N 3N.   N^2 ]
u = 1:N;
B = u'*u

% C = 
%   [ 1         -1     1  ...   -1^(N+1)  
%    -1          1    -1  ...   -1^N
%     1         -1     1  ...   -1^(N+1)
%     ..............................
%     -1^(N+1) -1^N  -1^(N+1) ......     ]

% Modo 1
% La somma tra un vettore colonna v di dimensione n e uno riga w di dimensione
% ha come risultato una matrice nxm con la somma dove il risultato r in
% posizione (i,j) corrisponde a
%                       r(i,j) = v(i) + w(j)
% https://it.mathworks.com/help/matlab/ref/plus.html
C = (-1).^(u'+u)

% Modo 2
% Sfrutto la moltiplicazione riga per colonna
t = (-1) .^ (1:N)
C1 = t' * t

% D = 
%   [   2    3    4 ...  N+1 |  0    1    2  ...  N-1   
%       3    4    5 ...  N+2 | -1    0    1  ...  N-2 
%      ..................... | ......................
%      N+1  N+2  N+3 ... 2N  | 1-N  2-N  3-N ...   0
%    -------------------------------------------------
%       0   -1   -2  ... 1-N |  2    3    4  ...  N+1
%       1    0   -1  ... 2-N |  3    4    5  ...  N+2
%      ..................... | ......................
%      N-1  N-2  N-3 ...  0  | N+1  N+2  N+3 ...  2N    ]

top_sx = u+u';
top_dx = u-u';
bot_sx = top_dx';
bot_dx = top_sx;

D =  [ top_sx , top_dx ; bot_sx , top_sx ]

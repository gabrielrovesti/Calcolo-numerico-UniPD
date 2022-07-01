function d = mydet(A)
% Help: mydet
% Calcolo del determinante di A tramite fattorizzazione LU con pivoting
% ----------INPUT----------------------------------------------------------
% A             Matrice di input 
% ----------OUTPUT---------------------------------------------------------
% d             Determinante della matrice di input
%-----------FUNCTION BODY--------------------------------------------------

[L,U,P] = lu(A);
d = prod(diag(U))
end

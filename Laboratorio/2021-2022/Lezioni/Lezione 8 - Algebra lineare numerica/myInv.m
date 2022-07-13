function A1=myInv(A)
% Help: myInv
% Restituisce l'inversa di una matrice A
% INPUT--------------------------------------------------------------------
% A     double [m X m] Matrice quadrata
% OUTPUT ------------------------------------------------------------------
% A1    double [m X m] Matrice inversa ricavata con LU
% -------------------------------------------------------------------------
    [L, U, P]=lu(A);
    A1=U\(L\P);
end
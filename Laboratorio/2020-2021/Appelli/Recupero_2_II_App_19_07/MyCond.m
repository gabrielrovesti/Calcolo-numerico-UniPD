function [Kappa] = MyCond(A, p, toll)
%%
% La funzione calcola il condizionamento della matrice A
% INPUT:
% A = matrice [NxN]
% p = p-norm [scalare]
% toll = tolleranza [scalare]
% OUTPUT:
% Kappa = condizionamento della matrice A
%%

Ainv=MyQRInv(A, toll);
switch p
    case 1
        Kappa=norm(A,1)*norm(Ainv,1);
    case Inf
        Kappa=norm(A,Inf)*norm(Ainv,Inf);
end

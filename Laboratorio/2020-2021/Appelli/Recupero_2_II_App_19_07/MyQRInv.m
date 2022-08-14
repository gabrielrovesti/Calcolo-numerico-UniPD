function [Ainv] = MyQRInv(A, toll)
%%
% La funzione calcola l'inversa della matrice A
% INPUT:
% A = matrice [NxN]
% toll = tolleranza [scalare]
% OUTPUT:
% Ainv = inversa della matrice A
%%

% punto 1
[Q R]=qr(A);

if min(abs(diag(R)))<toll % punto 2
    error('errore');
else % punto 3
    for i=1:size(Q',2)
        Ainv(:,i)=SostituzioneIndietro(R,Q(:,i)');
    end
end
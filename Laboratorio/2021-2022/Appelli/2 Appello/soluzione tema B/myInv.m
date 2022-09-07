function [Ainv] = myInv(A)
% Calcola l'inversa Ainv della matrice A
%
% --INPUT-------------------------------
% A : [n x n] matrice di partenza
%
% --OUTPUT------------------------------
% Ainv : [n x n] matrice inversa di A

n = size(A);
[L,U,P] = lu(A);
B = eye(n);         % matrice identità della stessa dimensione di A
Ainv = zeros(n);    % prealloco la matrice inversa

for i = 1:n
    % y = L\(P*b);
    % x = U\y;
    b = B(:,i);
    y = SostituzioneAvanti(L,P*b);
    x = SostituzioneIndietro(U,y);
    Ainv(:,i) = x;
end

end
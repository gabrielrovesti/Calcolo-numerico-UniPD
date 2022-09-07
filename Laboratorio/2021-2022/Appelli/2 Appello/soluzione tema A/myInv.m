function Ainv = myInv(A)
% Calcola l'inversa Ainv della matrice A
%
% INPUT  ------------------------------------------------------------------
%       A : [n x n] matrice di partenza
%
% OUTPUT  -----------------------------------------------------------------
%       Ainv : [n x n] matrice inversa di A
%--------------------------------------------------------------------------
    [Q, R] = qr(A);
    B = eye(length(A));
    for i = 1:length(A)
        Ainv(:, i) = SostituzioneIndietro(R, Q'*B(:,i));
    end
end

%Ragionamento:
% 
% AX = B
% A = QR
% QRX = B
% RX = Q'B   sfruttando l'ortogonalità di Q
% 
% Si usa poi la Sostituzione all'Indietro dato che richiede una matrice
% triangolare superiore, e R per definizione è una matrice triangolare
% superiore.
%
=======
function Ainv = myInv(A)
% Calcola l'inversa Ainv della matrice A
%
% INPUT  ------------------------------------------------------------------
%       A : [n x n] matrice di partenza
%
% OUTPUT  -----------------------------------------------------------------
%       Ainv : [n x n] matrice inversa di A
%--------------------------------------------------------------------------
    [Q, R] = qr(A);
    B = eye(length(A));
    for i = 1:length(A)
        Ainv(:, i) = SostituzioneIndietro(R, Q'*B(:,i));
    end
end

%Ragionamento:
% 
% AX = B
% A = QR
% QRX = B
% RX = Q'B   sfruttando l'ortogonalità di Q
% 
% Si usa poi la Sostituzione all'Indietro dato che richiede una matrice
% triangolare superiore, e R per definizione è una matrice triangolare
% superiore.
%
% b (termine noto) è un vettore --> e Q'*B(:,i) restituisce un vettore.
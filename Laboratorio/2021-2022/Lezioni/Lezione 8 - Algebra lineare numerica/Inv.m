function A1 = Inv(A)
% Help: Inv
% Restituisce l'inversa di una matrice A
% INPUT--------------------------------------------------------------------
% A     double [m X m] Matrice quadrata
% OUTPUT ------------------------------------------------------------------
% A1    double [m X m] Matrice inversa ricavata con LU e
%                      con algoritmi di sostituzione modificati
% -------------------------------------------------------------------------

% Inizializzazione del risultato (eventualmente nullo)
A1 = zeros(size(A));
% Calcolo della fattorizzazione LU
[L,U,P] = lu(A);
% Inizializzazione della matrice identità con size di A, utile per le due
% sostituzioni modificate create sopra
B = eye(size(A));
% Richiamo di SostituzioneAvantiBis (sempre con L/P*b o Lx = b) e
% SostituzioneIndietroBis (come U/Y, quindi come Ux = b)
A1 = SostituzioneIndietroBis(U, SostituzioneAvantiBis(L,P*B));
end
    
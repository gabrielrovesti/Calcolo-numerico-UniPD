function [x, r, res] = MinNormLs(A, b, toll)
% HELP - MinNormLs
% Calcola la soluzione di norma minima delle equazioni normali ai
% minimi quadrati, il rango della matrice A e la norma del residuo
% delle equazioni normali
% INPUT--------------------------------------------------------------------
% A     	double [m X m]	Matrice quadrata di input
% b     	double [1 x m]     Termine noto
% toll  	double [1 x 1]	Soglia di tolleranza
% OUTPUT-------------------------------------------------------------------
% x     	double [N x 1]	Soluzione di norma minima
% r     	double [1 x 1]	Rango della matrice A
% res   	double [1 x 1]	Norma del residuo delle eq. normali
%--------------------------------------------------------------------------

% Questa variabile viene inizializzata per considerare la “versione di prova”
% che lui intende
test = false;

% Punto 1 – Esegue la fattorizzazione QR completa di A
[Q,R] = qr(A);
% Punto 2 – Approssimazione del rango degli elementi della diagonale
% qualora questi abbiano valore assoluto >= n*toll
if test
    r = rank(A);
else
% Piccola nota: il numero delle colonne di A è dato da length
% Grazie al calcolo, noi salviamo in r solamente gli elementi diagonali per i quali
% la somma del valore assoluto in R sia maggiore al n. di colonne per la tolleranza
    r = sum(abs(diag(R)) >= length(A) * toll);
end
%% Punto 3 – Definizione di Q0, R0 ed S; Q0 è l’insieme delle colonne da 1 ad n+1 (che
% sarebbe infatti il rango della matrice), R0 è l’insieme delle righe da 1 ad n+1
% ed S che sarebbe il prodotto di R0
R0 = R(1:r, :);
Q0 = Q(:,1:r);
S  = R0 * R0';
% Questo corrisponde alla “versione di prova” che usa backslash su S su Sy = R0b
if test
    y = S \ (R0 * b);
else
% Soluzione Sy = R0b con il metodo LU
    [L,U,P] = lu(S);
    y  = U\(L\(P * R0 * b));
end
%% Punto 5 – calcolo di x = Q0 * y e della norma del residuo ||AtAx – Atb||
x = Q0 * y;
res = norm(A' * A * x - A' * b);
end

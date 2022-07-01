function d = mysymdet(V)
% Help: mydet
% Calcolo del determinante di V tramite fattorizzazione QR
% ----------INPUT----------------------------------------------------------
% V         Matrice [m+1 x n+1]    Vandermonde di input 
% ----------OUTPUT---------------------------------------------------------
% d         Determinante della Vandermonde con QR
%-----------FUNCTION BODY--------------------------------------------------

G = V * V';
[Q0,R0]=qr(G,0);
b=V*ones(size(V));
y = G \ (R0 * b);
d = Q0 * y;
end

function [peval,c]=MyPolyfit(xfit,xeval,yfit,deg)

%%Nota: le eq. Normal intende
%%lo stimatore con i residui delle matrici
%%ed in particolare (X'X).^-1.*X'.*y

%%Il backslash poi è la divisione della matrice a sx
%%del tipo X = A\B ed A*X=B
V=xfit.^(0:deg);
%%da quello che ho visto in giro
%%si usa la fattorizzazione LU
%%in questo modo
[L, U, P] = lu(V);
c=P*b;
y=L\c;  %%triangolare inferiore
x=U\y;  %%triangolare superiore

%%Idea adattante sost. indietro
%%e calcolo con backslash
c=SostituzioneIndietro(x,(y'.*yfit));
Veval=V\xeval;
peval=Veval*c;
end
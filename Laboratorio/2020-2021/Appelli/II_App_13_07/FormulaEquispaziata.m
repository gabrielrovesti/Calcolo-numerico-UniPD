function [x,w]=FormulaEquispaziata(a,b,n)
% calcolo di nodi e pesi per formula di quadratura equispaziata
% interpolatoria di grado n
%--------------------------------------------------------------------------
% INPUT
% a     estremo inferiore di integrazione
% b     estremo superiore di integrazione
% n     grado di precisione polinomiale
%--------------------------------------------------------------------------
% OUTPUT
% x     vettore riga dei nodi
% w     vettore colonna dei pesi
%--------------------------------------------------------------------------
x=linspace(a,b,n+1);
A=x.^((0:n)');
c=(b.^((1:n+1)')-a.^((1:n+1)'))./((1:n+1)');
[L,U,P]=lu(A);
z=L\(P*c);
w=U\z;
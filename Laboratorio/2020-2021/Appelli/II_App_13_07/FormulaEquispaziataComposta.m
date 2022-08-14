function [x,w]=FormulaEquispaziataComposta(a,b,N,n)
% calcolo di nodi e pesi per formula di quadratura equispaziata composta
% costruita con la composizione di formule interpolatorie di grado n
%--------------------------------------------------------------------------
% INPUT
% a     estremo inferiore di integrazione
% b     estremo superiore di integrazione
% N     numero di sottoiointervalli
% n     grado di precisione polinomiale
%--------------------------------------------------------------------------
% OUTPUT
% x     vettore riga dei nodi
% w     vettore colonna dei pesi
%--------------------------------------------------------------------------
pts=linspace(a,b,N+1);
x=zeros(1,N*n+1); w=x';
for k=1:N
    [xloc,wloc]=FormulaEquispaziata(pts(k),pts(k+1),n);
    x(n*(k-1)+1:n*k+1)=xloc;
    w(n*(k-1)+1:n*k+1)=w(n*(k-1)+1:n*k+1)+wloc;
end

function [w,W,flag]=FormulaInterpolatoria(xinterp,a,b,toll,Nmax)
% calcola i pesi di una formula interpolatoria approssimata con nodi
% xinterp
% INPUT--------------------------------------------------------------------
% xinterp           double [n+1 x 1] nodi di quadratura
% a                 double [1 x 1] estremo inferiore dell'intervallo
% b                 double [1 x 1] estremo superiore dell'intervallo
% toll              double [1 x 1] tolleranza assoluta per il raffinamento
% Nmax              double [1 x 1] massimo numero di punti di quadratura
%                                   ammessi per il raffinamento
% OUTPUT
% w                 double [1 x n+1] pesi di quadratura
% W                 double [itmax x n+1] approssimazioni successive dei
%                                   pesi di quadratra
% flag              double [1 x 1] 
%                   = 1 la tolleranza è stata raggiunta
%                   = 0 tolleranza non raggiunta
%--------------------------------------------------------------------------
% CALLS
%                   Parabole.m  Calcola formula di quadratura parabolole
%                   LagrangePoly.m Calcola matrice dei pol. di Lagrange
%--------------------------------------------------------------------------
N=1;
[xeval,wp]=Parabole(a,b,N);
L=LagrangePoly(xinterp,xeval);
w=wp*L;
W=w;flag=0;
step=toll+1;
while step>toll && N<Nmax/2
    N=2*N;
    [xeval,wp]=Parabole(a,b,N);
    L=LagrangePoly(xinterp,xeval);
    W=[W;wp*L];
    step=norm(W(end,:)-W(end-1,:));
end
w=W(end,:);
if step<toll
    flag=1;
end

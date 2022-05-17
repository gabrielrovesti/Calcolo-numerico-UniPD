function [peval,c]=MyPolyfit(xfit,xeval,yfit,deg)
%
% calcolo coefficienti del polinomio approssimante
% e valutazione sui nodi xeval seguendo il metodo QR
%
% INPUT
% xfit      double [m x 1] nodi di approssimazione
% xeval     double [M X 1] nodi di valutazione
% yfit      double [m x 1] dati da fittare
% deg       grado di approssimazione polinomiale
%
%OUTPUT
% peval     double [m x 1] polinomio valutato sulla successione
% c         double [m x 1] calcolo dei coefficienti dela sost. all'indietro
%

%FUNCTION BODY
V=chebvand1d(deg,xfit);
[Q, R] = qr(V);
R0 = R(1:deg+1,:);
Q0 = Q(:,1:deg+1);
c=SostituzioneIndietro(R0,(Q0'.*yfit));
Veval=chebvand1d(deg,xeval);
peval=Veval*c;
end
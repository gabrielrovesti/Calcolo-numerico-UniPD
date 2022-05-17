%
% approssimazione ai minimi quadrati della funzione di Runge
%
% INPUT
% f : function handle su 2000 punti equispaziati
% n : 150 calcoli 
%
% OUTPUT
%

% FUNCTION BODY
f = @(x) 1./(25.*x.^2+1);
xfit=linspace(-1,1,2000);
yfit=f(xfit);
xeval=linspace(-1,1,10000);
degs=2:2:150;
err=zeros(length(degs),1);

for deg=degs;
    [peval,c]=MyPolyfit(xfit,xeval,yfit,deg);
    peval=xeval.*c;
    err(deg)=max(abs(xeval - peval));
end
figure(1)
semilogy(degs,err);
title('Massimo errore sui punti di valutazione');

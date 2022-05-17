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

xeval_cheb=zeros(length(degs),1);
degs=1:1:150;
err_cheb=zeros(length(degs),1);

for deg=degs
    [xeval_cheb,c]=MyPolyfit(xfit,xeval,yfit,deg);
    peval=xeval_cheb.*c;
    xeval_cheb(deg)=cos((deg*pi)/degs);
    err_cheb(deg)=max(abs(xeval_cheb(deg) - peval));
end
figure(1)
semilogy(degs,err)
title('Massimo errore sui punti di valutazione');
hold on
semilogy(degs,err_cheb)
title('Errore successione campionamento Chebyshev');
legend('Errore punti di valutazione equi','Errore con Chebyshev' )


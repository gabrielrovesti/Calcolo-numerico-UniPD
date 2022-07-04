clear all
close all

%f=@(x) 1./(25*x.^2+1);
f=@(x) exp(1).^(-1./(1-x.^2));
%f=@(x) sin(pi*x)
xfit=linspace(-1,1,2001)';
xfit1=cos(pi*(1+xfit)/2);
xeval=linspace(-1,1,10000)';
yfit=f(xfit);
yfit1=f(xfit1);
yeval=f(xeval);
degs=2:2:150;
k=1;
%%
for n=degs
    peval=MyPolyfit(xfit,xeval,yfit,n);
    peval1=MyPolyfit(xfit1,xeval,yfit1,n);
    err(k)=max(abs(peval-yeval));
    err1(k)=max(abs(peval1-yeval));
    k=k+1;
end
%%
semilogy(degs,err)
title('Massimo errore sui punti di valutazione');
hold on
semilogy(degs,err1,'g');
legend('Errore equispaziati','Errore Chebyshev');

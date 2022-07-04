clear all
close all

%f=@(x) 1./(25*x.^2+1);
f=@(x) exp(1).^(-1./(1-x.^2));
%f=@(x) sin(pi*x)
xfit=linspace(-1,1,2001)';
xeval=linspace(-1,1,10000)';
yfit=f(xfit);
yeval=f(xeval);
degs=2:2:150;
k=1;
%%
for n=degs
    peval=MyPolyfit(xfit,xeval,yfit,n);
    err(k)=max(abs(peval-yeval));
    k=k+1;
end
%%
semilogy(degs,err)
legend('Errore punti di valutazione');



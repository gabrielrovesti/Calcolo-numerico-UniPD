clear all
close all
f=@(x) (x.^2-1).*(log(x+1)-x);
df=@(x) 2*x.*(log(x+1)-x)-(x.^2-1).*x./(x+1);
n=8;
xinterp=0.5*cos((0:n)./n*pi);
yinterp=f(xinterp');
c=polyfit(xinterp,yinterp,n);
cder=c(1:end-1).*(n:-1:1);
p=@(x) polyval(c,x);
dp=@(x) polyval(cder,x);
%%
x0=-0.6;
toll=10^-12;
itmax=100;
method='s';
[zero,res,iterates,flag]=Newton(p,dp,x0,toll,itmax,method);
steps=abs(iterates(2:end)-iterates(1:end-1));
figure(4);
semilogy(steps)
hold on
semilogy(abs(iterates))
legend('scarti','residui')
title('profilo di convergenza Newton')
fprintf('effetto 1: non c''è instabilità\n')
fprintf('effetto 2: lo zero del polinomio è semplice, Newton converge quadraticamente\n')

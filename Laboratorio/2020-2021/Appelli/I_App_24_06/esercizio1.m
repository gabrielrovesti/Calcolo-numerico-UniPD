clear all
close all
f=@(x) (x~=0).*(x.^2-1).*(log(x+1)-x);
df=@(x) 2*x.*(log(x+1)-x)-(x.^2-1).*x./(x+1);
xplot=linspace(-1,1,1000);
figure(1);
plot(xplot,f(xplot))
title('grafico di f')
%% punto 1
x0=-0.6;
toll=10^-4;
itmax=100;
method='s';
[zero,res,iterates,flag]=Newton(f,df,x0,toll,itmax,method);
steps=abs(iterates(2:end)-iterates(1:end-1));
figure(2);
semilogy(steps)
hold on
semilogy(abs(iterates))
legend('scarti','residui')
title('profilo di convergenza Newton')
%% punto 2
m=2;
[zeromod,resmod,iteratesmod,flagmod]=NewtonMod(f,df,x0,m,toll,itmax,method);
zeromod;
stepsmod=abs(iteratesmod(2:end)-iteratesmod(1:end-1));
figure(3);
semilogy(stepsmod)
hold on
semilogy(abs(iteratesmod));
legend('scarti','residui')
title('profilo di convergenza Newton Modificato')
fprintf('premi un tasto per vedere anche punto facoltativo\n')
pause()
%% punto 3 (facoltativo)
x0=-0.6;
toll=10^-12;
itmax=100;
method='s';
[zero,res,iterates,flag]=Newton(f,df,x0,toll,itmax,method);
steps=abs(iterates(2:end)-iterates(1:end-1));
figure(4);
semilogy(steps)
hold on
semilogy(abs(iterates))
legend('scarti','residui')
title('profilo di convergenza Newton')
m=2;
[zeromod,resmod,iteratesmod,flagmod]=NewtonMod(f,df,x0,m,toll,itmax,method);
zeromod;
stepsmod=abs(iteratesmod(2:end)-iteratesmod(1:end-1));
figure(5);
semilogy(stepsmod)
hold on
semilogy(abs(iteratesmod))
legend('scarti','residui')
title('profilo di convergenza Newton Modificato')
fprintf('c''e'' instabilità sia nel calcolo di f che nel calcolo della sua derivata,\n')
fprintf('questo in parte distrugge la convergenza\n')
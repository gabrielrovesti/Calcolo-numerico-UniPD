% ESERCIZIO 4
%% parametri globali
close all
clear
c=0.1;
f = @(x) exp(1 - 1./x) - exp(1) + c;
df = @(x) exp(1 - 1./x)./(x.^2);
ddf = @(x) exp(1 - 1./x).*(1 - 2.*x)./(x.^2);
cN= @(x) abs(ddf(x)./(2*df(x)));
xstar=1/(1-log(exp(1)-c)); % soluzione vera
toll=10^-12;
itmax=100;
x0=200;
method='s';
%% punto 1
a=100; b=500; xplot=linspace(a,b);
yplot=f(xplot);
dyplot=df(xplot);

F1=figure(1);
plot(xplot,yplot)
hold on
plot(xplot,dyplot)
plot(xplot,0*xplot)
legend('f','df','asse x')
title('funzione e derivata')
hold off

%% punto 2
[zeroB,resB,wresB,iteratesB,flagB]=Bisezione(f,a,b,toll,method);
[zeroN,resN,iteratesN,flagN]=Newton(f,df,x0,toll,itmax,method);

%% punto 3 
abs_res_vec_B=abs(f(iteratesB(1,:)));
abs_res_vec_N=abs(f(iteratesN));

err_B=abs(iteratesB(1,:)-xstar);
err_N=abs(iteratesN-xstar);

sB=abs(iteratesB(1,2:end)-iteratesB(1,1:end-1));
sN=abs(iteratesN(2:end)-iteratesN(1:end-1));

figure(2)
semilogy(abs_res_vec_B,'b--');
hold on
semilogy(sB,'b:');
semilogy(err_B,'b');
semilogy(abs_res_vec_N,'g--');
semilogy(sN,'g:');
semilogy(err_N,'g');
title('Raffronto dei risultati')
legend('abs residuo bisezione', 'scarto bisezione','errore bisezione',...
    'abs residuo newton', 'scarto newton','errore newton')
hold off

%% punto 5
figure(3)
semilogy(err_B(2:end)./sB,'b');
hold on
semilogy(err_N(2:end)./(sN.^2),'g');
semilogy(1/cN(xstar)+0.*err_N(2:end)./(sN.^2),'r:');
title('rapporto errore scarto');
legend('bisezione p=1','newton p=2','limite teorico')
hold off






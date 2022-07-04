% esercizio 6

clear all
close all
clc
% dati globali
a=-1;b=1; % estremi intervallo
alphas=[2/3,1,3/2,5/4];
m=1001; % num punti valutazione
degs=2:2:50; % gradi polinomiali considerati
nomefile='risultati.txt'; % nome del file stampa risultati
pausa=0.2;
%% corpo dell'esperimento


xeval=linspace(a,b,5001);
E_cheb=zeros(length(degs),length(alphas));
k=0;
for alpha=alphas
    f=@(x) abs(x).^alpha;
    f_eval=f(xeval)';
    k=k+1;
    j=0;
    for n=degs
        N=2*n^2;
        j=j+1;
        xinterp_cheb=(b-a)/2.*cos((2*(N-1:-1:0)+1)./(2*(N-1)+2)*pi)+(b+a)/2; % pti di Chebyshev
        yinterp_cheb=f(xinterp_cheb)';
        c=polyfit(xinterp_cheb,yinterp_cheb,n);
        yeval_cheb=polyval(c,xeval)';
%         figure(1);
%         plot(xeval,f_eval,'LineWidth',2);
%         hold on
%         plot(xinterp_cheb,yinterp_cheb,'p')
%         plot(xeval,yeval_cheb);
%         legend('f Runge','dati interpolati Cheb','Interp. cheb')
%         title(['Interpolazione a grado ' num2str(n)]);
%         hold off
%         pause(pausa)
        E_cheb(j,k)=max(abs(yeval_cheb-f_eval));
    end
end
%% grafico errori

figure(2);
semilogy(degs,E_cheb);
xlabel('grado di interpolazione');
ylabel('errore assoluto')
legend('alpha=2/3','alpha= 1','alpha= 5/4','alpha= 3/2');
title('Errori')
hold off
%%
figure(3);
semilogy(degs,E_cheb.^(1./alphas));
legend('alpha=2/3','alpha= 1','alpha= 5/4','alpha= 3/2');
title('Errori elevati alla 1/alpha')
hold off

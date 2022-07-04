clear all
close all
clc
% dati globali
f=@(x) 1./(x.^2+1);
a=-5;b=5; % estremi intervallo
m=5001; % num punti valutazione
degs=2:2:20; % gradi polinomiali considerati
pausa=0.2;
%% corpo dell'esperimento

E_equi=[];
E_cheb=[];
for n=degs
    N = 2*n^2;
    xeval=linspace(a,b,N);
    f_eval=f(xeval)';
    xinterp_equi=linspace(a,b,N);
    yinterp_equi=f(xinterp_equi)';
    xinterp_cheb=5*cos((2*(N-1:-1:0)+1)./(2*N+1)*pi); % pti di Chebyshev
    %xinterp_cheb=5*cos((n:-1:0)./n*pi); % pti di Gauss-Chebyshev
    yinterp_cheb=f(xinterp_cheb)';
    P_equi=polyfit(xinterp_equi,yinterp_equi,n);
    P_cheb=polyfit(xinterp_cheb,yinterp_cheb,n);
    yeval_equi=polyval(P_equi,xinterp_equi);
    yeval_cheb=polyval(P_cheb,xinterp_cheb);
    figure(1);
    plot(xeval,f_eval,'LineWidth',2);
    hold on
    plot(xinterp_equi,yinterp_equi,'*')
    plot(xinterp_cheb,yinterp_cheb,'p')
    plot(xeval,yeval_equi);
    plot(xeval,yeval_cheb);
    legend('f Runge','dati interpolati equi','dati interpolati Cheb',...
        'Interp. equi','Interp. cheb')
    title(['Interpolazione a grado ' num2str(n)]);
    hold off
    pause(pausa)
    E_equi=[E_equi,max(norm(yeval_equi-f_eval))];
    E_cheb=[E_cheb,max(norm(yeval_cheb-f_eval))];
end
%% grafico errori
figure(2);
semilogy(degs,E_equi);
hold on
semilogy(degs,E_cheb);
xlabel('grado di interpolazione');
ylabel('errore assoluto')
legend('err interp equi','err interp cheb');
title('Errori')
hold off
%% stampa a video
A=[degs;E_equi;E_cheb];
fprintf('Interpolazione della f. di Runge\n')
fprintf('-----------------------------------------------------\n')
fprintf(['Parametri: a=-5, b=5, ' num2str(m) ' punti di valutazione\n'])
fprintf('-----------------------------------------------------\n')
fprintf('Risultati:\n')
fprintf('|grado|\t |err interp equi   |\t |err interp cheb   |\n')
fprintf('-----------------------------------------------------\n')
fprintf('|%5d|\t |%1.12e|\t |%1.12e| \n',A)
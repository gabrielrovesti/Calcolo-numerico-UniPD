clear
close all
clc
warning off
% Dati globali
f=@(x) 1./(x.^2+1);
a=-5;b=5; % Estremi intervallo
m=5001; % Num punti valutazione
degs=2:2:20; % Gradi polinomiali considerati
pausa=0.2;
%% Corpo dell'esperimento
xeval=linspace(a,b,5001);
f_eval=f(xeval)';
E_equi=[];
E_cheb=[];
for n=degs
    xinterp_equi=linspace(a,b,n+1);
    yinterp_equi=f(xinterp_equi)';
    xinterp_cheb=5*cos((2*(n:-1:0)+1)./(2*n+2)*pi); % pti di Chebyshev
    yinterp_cheb=f(xinterp_cheb)';
    L_equi=LagrangePoly(xinterp_equi,xeval);
    L_cheb=LagrangePoly(xinterp_cheb,xeval);
    yeval_equi=L_equi*yinterp_equi;
    yeval_cheb=L_cheb*yinterp_cheb;
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
    E_equi=[E_equi,max(abs(yeval_equi-f_eval))];
    E_cheb=[E_cheb,max(abs(yeval_cheb-f_eval))];
end
%% Grafico errori
figure(2);
semilogy(degs,E_equi);
hold on
semilogy(degs,E_cheb);
xlabel('grado di interpolazione');
ylabel('errore assoluto')
legend('err interp equi','err interp cheb');
title('Errori')
hold off
%% Stampa a video
A=[degs;E_equi;E_cheb];
fprintf('Interpolazione della f. di Runge\n')
fprintf('-----------------------------------------------------\n')
fprintf(['Parametri: a=-5, b=5, ' num2str(m) ' punti di valutazione\n'])
fprintf('-----------------------------------------------------\n')
fprintf('Risultati:\n')
fprintf('|grado|\t |err interp equi   |\t |err interp cheb   |\n')
fprintf('-----------------------------------------------------\n')
fprintf('|%5d|\t |%1.12e|\t |%1.12e| \n',A)
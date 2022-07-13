clear all
close all
clc
% dati globali
f=@(x) 1./(x.^2+1);
a=-5;b=5; % estremi intervallo
m=5001; % num punti valutazione
degs=2:2:100; % gradi polinomiali considerati
pausa=0.2;
%% corpo dell'esperimento
xeval=linspace(a,b,5001);
f_eval=f(xeval)';
E_equi=[];
E_cheb=[];
E_equi_matlab=[];
E_cheb_matlab=[];
E_rieval_equi=[];
E_rieval_cheb=[];
E_rieval_equi_matlab=[];
E_rieval_cheb_matlab=[];
for n=degs
    xinterp_equi=linspace(a,b,n+1);
    yinterp_equi=f(xinterp_equi)';
    xinterp_cheb=5*cos((2*(n:-1:0)+1)./(2*n+2)*pi); % pti di Chebyshev
    %xinterp_cheb=5*cos((n:-1:0)./n*pi); % pti di Gauss-Chebyshev
    yinterp_cheb=f(xinterp_cheb)';
    L_equi=LagrangePoly(xinterp_equi,xeval);
    L_cheb=LagrangePoly(xinterp_cheb,xeval);
    L_rieval_equi=LagrangePoly(xinterp_equi,xinterp_equi);
    L_rieval_cheb=LagrangePoly(xinterp_cheb,xinterp_cheb);
    yeval_equi=L_equi*yinterp_equi;
    yeval_cheb=L_cheb*yinterp_cheb;
    c_equi=polyfit(xinterp_equi,yinterp_equi,n);
    c_cheb=polyfit(xinterp_cheb,yinterp_cheb,n);
    yeval_equi_matlab=polyval(c_equi,xeval);
    yeval_cheb_matlab=polyval(c_cheb,xeval);
    yrieval_equi=L_rieval_equi*yinterp_equi;
    yrieval_cheb=L_rieval_cheb*yinterp_cheb;
    yrieval_equi_matlab=polyval(c_equi,xinterp_equi); %teoricamente = a yeval_..
    yrieval_cheb_matlab=polyval(c_cheb,xinterp_cheb);
% errori su punti di valutazione
    E_equi=[E_equi,max(abs(yeval_equi-f_eval))];
    E_cheb=[E_cheb,max(abs(yeval_cheb-f_eval))];
    E_equi_matlab=[E_equi_matlab,max(abs(yeval_equi_matlab'-f_eval))];
    E_cheb_matlab=[E_cheb_matlab,max(abs(yeval_cheb_matlab'-f_eval))];
% errori sui punti di interpolazione
    E_rieval_equi=[E_rieval_equi,max(abs(yrieval_equi-yinterp_equi))];
    E_rieval_cheb=[E_rieval_cheb,max(abs(yrieval_cheb-yinterp_cheb))];
    E_rieval_equi_matlab=[E_rieval_equi_matlab,max(abs(yrieval_equi_matlab'-yinterp_equi))];
    E_rieval_cheb_matlab=[E_rieval_cheb_matlab,max(abs(yrieval_cheb_matlab'-yinterp_cheb))];
end
%% grafico errori
figure(2);
subplot(1,2,1);
semilogy(degs,E_equi,'r');
hold on
semilogy(degs,E_cheb,'g');
semilogy(degs,E_equi_matlab,'r--');
semilogy(degs,E_cheb_matlab,'g--');
xlabel('grado di interpolazione');
ylabel('errore assoluto')
legend('err interp equi Lagrange','err interp Cheb Lagrange',...
    'err interp equi matlab','err interp Cheb matlab');
title('Errori su punti di valutazione')
hold off
subplot(1,2,2);
semilogy(degs,E_rieval_equi,'r');
hold on
semilogy(degs,E_rieval_cheb,'g');
semilogy(degs,E_rieval_equi_matlab,'r--');
semilogy(degs,E_rieval_cheb_matlab,'g--');
legend('err interp equi Lagrange','err interp Cheb Lagrange',...
    'err interp equi matlab','err interp Cheb matlab');
title('errori sui punti di interpolazione')
%% stampa a video
A=[degs;E_equi;E_cheb;E_equi_matlab;E_cheb_matlab];
fprintf('Interpolazione della f. di Runge\n')
fprintf('-----------------------------------------------------\n')
fprintf(['Parametri: a=-5, b=5, ' num2str(m) ' punti di valutazione\n'])
fprintf('-----------------------------------------------------\n')
fprintf('Risultati:\n')
fprintf('|grado|\t |err interp equi   |\t |err interp cheb   |\t |err interp equi mat|\t |err interp cheb mat|\n')
fprintf('-----------------------------------------------------\n')
fprintf('|%5d|\t |%1.12e|\t |%1.12e|\t |%1.12e|\t |%1.12e| \n',A)
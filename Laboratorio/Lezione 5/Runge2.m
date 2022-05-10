clear all
close all

% dati globali
f=@(x) 1./(x.^2+1);
a=-5;b=5; % estremi intervallo
m=5001; % num punti valutazione
degs=2:2:102; % gradi polinomiali considerati

%% corpo dell'esperimento
xeval=linspace(a,b,5001);
f_eval=f(xeval)';
%%Definizione dei nodi equispaziati,
%%dei nodi di valutazione e dei nodi di Chebyshev
E_equi=zeros(1,length(degs));
E_cheb=zeros(1,length(degs));
E_equi_matlab=zeros(1,length(degs));
E_cheb_matlab=zeros(1,length(degs));
E_rieval_equi=zeros(1,length(degs));
E_rieval_cheb=zeros(1,length(degs));
E_rieval_equi_matlab=zeros(1,length(degs));
E_rieval_cheb_matlab=zeros(1,length(degs));

i=1;
for n=degs
    xinterp_equi=linspace(a,b,n+1);
    yinterp_equi=f(xinterp_equi)';
	
    xinterp_cheb=cos((2*(n:-1:0)+1)./(2*n+2)*pi); % pti di Chebyshev
    yinterp_cheb=f(xinterp_cheb)';

	%%Polinomi di Lagrange
    L_equi=LagrangePoly(xinterp_equi,xeval);
    L_cheb=LagrangePoly(xinterp_cheb,xeval);
    yeval_equi=L_equi*yinterp_equi;
    yeval_cheb=L_cheb*yinterp_cheb;
    
	%%Nodi equispaziati e di Chebyshev con polyfit
    %%e polyval
    p_equi = polyfit(xinterp_equi,yinterp_equi,n);
    p_cheb = polyfit(xinterp_cheb,yinterp_cheb,n);
    p_eval_equi=polyval(p_equi, xeval);
    p_eval_cheb=polyval(p_cheb, xeval);
   
    %%Calcolo dell'interpolatore
    %%e delle famiglie di nodi
    L_rieval_equi=LagrangePoly(xinterp_equi,xinterp_equi);
    L_rieval_cheb=LagrangePoly(xinterp_cheb,xinterp_cheb);
    yrieval_equi=L_rieval_equi*yinterp_equi;
    yrieval_cheb=L_rieval_cheb*yinterp_cheb;

    yrieval_equi_matlab=polyval(p_equi,xinterp_equi);
    yrieval_cheb_matlab=polyval(p_cheb,xinterp_cheb);

    % Punto 4
    % Errori di valutazione
    E_equi(i) = max(abs(yeval_equi-f_eval));
    E_cheb(i) = max(abs(yeval_cheb-f_eval));
    E_equi_matlab(i) = max(abs(p_eval_equi'-f_eval));
    E_cheb_matlab(i) = max(abs(p_eval_cheb'-f_eval));

    % Errori di interpolazione
    E_rieval_equi(i) = max(abs(yrieval_equi-yinterp_equi));
    E_rieval_cheb(i) = max(abs(yrieval_cheb-yinterp_cheb));
    E_rieval_equi_matlab(i) = max(abs(yrieval_equi_matlab'-yinterp_equi));
    E_rieval_cheb_matlab(i) = max(abs(yrieval_cheb_matlab'-yinterp_cheb));

    i = i + 1;
end
% grafico errori
figure(1);
% errori di valutazione
subplot(1,2,1);
semilogy(degs,E_equi,'r');
hold on
semilogy(degs,E_cheb,'g');
semilogy(degs,E_equi_matlab,'r--');
semilogy(degs,E_cheb_matlab,'g--');
xlabel('Grado di interpolazione');
ylabel('Errore assoluto')
legend('Errore equispaziati','Errore Chebyshev','Errore Equispaziati Matlab','Errore Equispaziati Matlab');
title('Errori su punti di valutazione')
hold off
%errori di interpolazione
subplot(1,2,2);
semilogy(degs,E_rieval_equi,'r');
hold on
semilogy(degs,E_rieval_cheb,'g');
semilogy(degs,E_rieval_equi_matlab,'r--');
semilogy(degs,E_rieval_cheb_matlab,'g--');
xlabel('Grado di interpolazione');
ylabel('Errore assoluto')
legend('Errore equispaziati','Errore Chebyshev','Errore Equispaziati Matlab','Errore Equispaziati Matlab');
title('Errori sui punti di interpolazione')
hold off

%%Salta gli altri due punti perché troppo pretenziosi (cit. prof)
%%perché il resto è fattibile invece

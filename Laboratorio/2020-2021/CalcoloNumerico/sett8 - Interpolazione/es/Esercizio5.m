clear all
close all

% dati globali
a=-1;b=1; % estremi intervallo
alphas=[2/3,1,3/2,5/4];
m=5001; % num punti valutazione
degs=2:2:50; % gradi polinomiali considerati

%% corpo dell'esperimento
xeval=linspace(a,b,m);
E_cheb=zeros(length(degs),length(alphas));
k=0;
for alpha=alphas
    f = @(x) abs(x).^alpha;
    f_eval = f(xeval)';
    j = 0;
    k = k+1;
    for n=degs
        N = 2*n^2
        j = j+1;
        xinterp_cheb=(b-a)/2.*cos((2*(N-1:-1:0)+1)./(2*(N-1)+2)*pi)+(b+a)/2; % pti di Chebyshev
        yinterp_cheb = f(xinterp_cheb);

        p = polyfit(xinterp_cheb,yinterp_cheb,n);
        yeval_cheb = polyval(p,xeval)';

        E_cheb(j,k) = max(abs(yeval_cheb-f_eval));
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

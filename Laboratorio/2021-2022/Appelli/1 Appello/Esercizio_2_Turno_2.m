clear
close all
warning off
clc
% Inizializzazione variabili iniziali
x0=1;
toll=1e-10;
maxit=40;
g1=@(x) cos(x);
g2=@(x) cos(x)-1;
% Richiamo della funzione PuntoFisso per g1 e g2
[pfisso1, iterates1, flag1]=PuntoFisso(g1, x0, toll, maxit);
[pfisso2, iterates2, flag2]=PuntoFisso(g2, x0, toll, maxit);
% Grafico con scarti e rapporto scarti (nel dubbio ho messo plot, non ho idea
% se convenga mettere semilog); l'ordine è p=1 per la teoria
p=1;
s1=abs(iterates1(2:end) - iterates1(1:end-1));
s2=abs(iterates2(2:end) - iterates2(1:end-1));
%%
figure(1);
semilogy(s1)
hold on
semilogy(s2)
title('Confronto scarti soluzioni')
legend('Scarto di f', 'Scarto di g')
hold off
%%
p=1;
figure(2);
semilogy(abs(s1(2:end)./s1(1:end-1).^p))
hold on
semilogy(abs(s2(2:end)./s2(1:end-1).^p))
title('Confronto rapporto degli scarti soluzioni')
legend('Rapporto scarti di f', 'Rapporto scarti di g')
hold off
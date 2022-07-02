clear
close all
warning off
clc
% inizializzazione variabili iniziali
x0=1;
toll=1e-10;
maxit=40;
g1=@(x) cos(x);
g2=@(x) cos(x)-1;

% richiamo della funzione PuntoFisso per g1 e g2 (stampe opzionali fatte da me)
[pfisso1, iterates1, flag1]=PuntoFisso(g1, x0, toll, maxit);
fprintf('Primo zero calcolato %1.12f\n',pfisso1)
fprintf('partendo da x0=%1.12f\n',x0)
fprintf('in %d iterazioni\n',length(iterates1))
fprintf('\n')

[pfisso2, iterates2, flag2]=PuntoFisso(g2, x0, toll, maxit);
fprintf('Secondo zero calcolato %1.12f\n',pfisso2)
fprintf('partendo da x0=%1.12f\n',x0)
fprintf('in %d iterazioni\n',length(iterates2))
fprintf('Tolleranza raggiunta\n')

% grafico con scarti e rapporto scarti (nel dubbio ho messo plot, non ho idea
% se convenga mettere semilog); l’ordine è p=1 nel caso 1 e p=2 nel caso 2
p=1;
s1=abs(iterates1);
figure(1);
plot(s1)
hold on
plot(abs(s1(2:end)./s1(1:end-1).^p))
title('Prima appross. cost. asintotica per conv. lineare')
legend("Vettore scarti", "Rapporto scarti");

p=2;
s2=abs(iterates2);
figure(2);
plot(s2)
hold on
plot(abs(s2(2:end)./s2(1:end-1).^p))
title('Seconda appross. cost. asintotica per conv. quadratica')
legend("Vettore scarti", "Rapporto scarti");

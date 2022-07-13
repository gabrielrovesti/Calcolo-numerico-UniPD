clear
close all
clc
warning off
% Definizione variabili iniziali e funzioni f e g
x0=1.9;
x1=2;
toll=1e-12;
maxit=40;
f=@(x) cos(x) - x;
g=@(x) x.*log(x+1);
% Chiamata alla funzione Secanti per f e g
[zero1, xf]=Secanti(f, x0, x1, toll, maxit);
[zero2, xg]=Secanti(g, x0, x1, toll, maxit);
%%
% Cercando in giro, il metodo delle secanti ha questa convergenza 
p=(1+sqrt(5))/2;
s1=abs(xf(2:end)-xf(1:end-1));
s2=abs(xg(2:end)-xg(1:end-1));
%%
figure(1);
semilogy(s1);
hold on
semilogy(s2);
title('Confronto scarti soluzioni')
legend('Scarto di f', 'Scarto di g')
hold off
%%
figure(2);
semilogy(abs(s1(2:end)./s1(1:end-1).^p));
hold on
semilogy(abs(s2(2:end)./s2(1:end-1).^p));
title('Confronto rapporto degli scarti soluzioni')
legend('Rapporto scarti di f', 'Rapporto scarti di g')
hold off

clear
close all
clc

% definizione variabili iniziali e funzioni f e g
x0=1.9;
x1=2;
toll=1e-12;
maxit=40;
f=@(x) cos(x) - x;
g=@(x) x.*log(x+1);

% chiamata alla funzione Secanti per f e g (con stampe opzionali fatte da me)
[zero1, xf]=Secanti(f, x0, x1, toll, maxit);
fprintf('Primo zero calcolato %1.12f\n',zero1)
fprintf('partendo da x0=%1.12f\n',x0)
fprintf('in %d iterazioni\n',length(xf))
fprintf('\n')

[zero2, xg]=Secanti(g, x0, x1, toll, maxit);
fprintf('Secondo zero calcolato %1.12f\n',zero2)
fprintf('partendo da x0=%1.12f\n',x0)
fprintf('in %d iterazioni\n',length(xg))

% come sotto, non ho idea se serva un ordine particolare, essendo simile a Newton
% (che ha convergenza quadratica), allora ho messo conv. quadratica (p=2)
p=2;
s1=abs(xf);
figure(1);
plot(s1)
hold on
plot(abs(s1(2:end)./s1(1:end-1).^p))
title('Prima appross. cost. asintotica per conv. quadr.')
legend('Vettore scarti', 'Rapporto scarti');

p=2;
s2=abs(xg);
figure(2);
plot(s2)
hold on
plot(abs(s2(2:end)./s2(1:end-1).^p))
title('Seconda appross. cost. asintotica per conv. quadr.')
legend('Vettore scarti', 'Rapporto scarti');

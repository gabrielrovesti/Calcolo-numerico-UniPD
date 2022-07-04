
f = @(x) (x.^2-1).*(log(1+x)-x);
df = @(x) 2*x .*(log(1+x)-x) + (x.^2-1).* (1./(1+x) -1);

x0 = -0.6;

% x=-1, x=0, x=1 sono gli zeri di f in [-1,1]
% Quello intermedio è x=0
vero_zero = 0;

% Alternativamente si possono notare dal grafico nella figura 6:

%xplot = linspace(-1,1,100);
%figure(6);
%plot(xplot, f(xplot)); hold on;
%plot(xplot, xplot .* 0);
%plot(xplot, df(xplot)); hold off;
%title('f');
%legend('f','x=0','df');

[zero,res,iterates,flag] = Newton(f, df, x0, 10^-4, 100, 's');

errori = abs(iterates - vero_zero);
scarti = abs(diff(iterates));

figure(1);
semilogy(errori);
hold on;
semilogy(scarti);
title('Errori assoluti e scarti con Newton');
legend('Errori', 'Scarti');
hold off;

% punto ii

% Si può notare dalla figura 7 che f''(0)!=0, quindi mi aspetto m=2

%xplot = linspace(-0.01,0.01,100);
%figure(7);
%plot(xplot, f(xplot)); hold on;
%plot(xplot, df(xplot)); hold off;
%title('f');
%legend('f','df');

m = round(scarti(end-1)/(scarti(end-1) - scarti(end)));
fprintf('m=%d\n',m);

[zerom,resm,iteratesm,flagm] = NewtonMod(f, df, x0, m, 10^-4, 100, 's');

errorim = abs(iteratesm - vero_zero);
scartim = abs(diff(iteratesm));

figure(2);
semilogy(errorim);
hold on;
semilogy(scartim);
title('Errori assoluti e scarti con NewtonMod');
legend('Errori', 'Scarti');
hold off;

% Punto iii

[zero2,res2,iterates2,flag2] = Newton(f, df, x0, 10^-8, 100, 's');

errori2 = abs(iterates2 - vero_zero);
scarti2 = abs(diff(iterates2));

figure(3);
semilogy(errori2);
hold on;
semilogy(scarti2);
title('Errori assoluti e scarti con Newton - toll=10^-8');
legend('Errori', 'Scarti');
hold off;

[zerom2,resm2,iteratesm2,flagm2] = NewtonMod(f, df, x0, m, 10^-8, 100, 's');

errorim2 = abs(iteratesm2 - vero_zero);
scartim2 = abs(diff(iteratesm2));

figure(4);
semilogy(errorim2);
hold on;
semilogy(scartim2);
title('Errori assoluti e scarti con NewtonMod - toll=10^-8');
legend('Errori', 'Scarti');
hold off;

fprintf('Il comportamento può essere spiegato col fatto che\n');
fprintf('sia x_n che f(x_n)/f''(x_n) tendono a 0,\n');
fprintf('quindi c''è instabilità nel calcolo di x_{n+1}\n');
fprintf('e il problema è mal condizionato\n');
fprintf('Una possibile soluzione al problema sarebbe\n');
fprintf('calcolare g(x) = f(x-1) e sottrarre 1 allo zero trovato.\n');

g = @(x) f(x-1);
dg = @(x) df(x-1);

vero_zerog = 1;

[zeromg,resmg,iteratesmg,flagmg] = NewtonMod(g, dg, x0 + 1, m, 10^-8, 100, 's');

errorimg = abs(iteratesmg - vero_zerog);
scartimg = abs(diff(iteratesmg));

figure(5);
semilogy(errorimg);
hold on;
semilogy(scartimg);
title('Errori assoluti e scarti con NewtonMod su g - toll=10^-8');
legend('Errori', 'Scarti');
hold off;
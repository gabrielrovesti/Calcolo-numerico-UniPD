toll=10^-8;
x0=-0.2;
maxit=10;

tollm=10^-20;
maxitm=20;
xmin=-0.5;
xmax=0.5;

f=@(x) ((gamma(x+1) - 1) .* x).^2;
f1=@(x) 2*((gamma(x+1)-1).*x).* ((2+ x.*mypsi(x)).*gamma(x+1)-1);

%% punto 1
xplot= linspace(xmin,xmax);
yplot=f(xplot);
yplot1=f1(xplot);

figure(1)
plot(xplot,yplot)
hold on
plot(xplot,yplot1)
hold off
title("Funzione e derivata")
legend("$f_1$","$f_1'$","Interpreter","latex","FontSize",16)

%% punto 2
[zero,res,iterates,flag] = Newton(f,f1,x0,toll,maxit,'s');
s=iterates(2:end) - iterates(1:end-1);

%% punto 3
C = abs(s(end)/s(end-1));
m = round(1/(1-C));
fprintf("Molteplicità simata: %d\n",m)

%% punto 4
[zerom,resm,iteratesm,flagm]=NewtonMod(f,f1,zero,m,tollm,maxitm,'s');

%% punto 5
sm = iteratesm(2:end) - iteratesm(1:end-1);
Cmvet= abs(sm(2:end)./sm(1:end-1).^2);
Cm=Cmvet(end);
Cmvetopt=Cmvet(end-1:end);


figure(2)
plot(Cmvet);

fprintf('Costante asintotica stimata= %1.12e\n',Cm)
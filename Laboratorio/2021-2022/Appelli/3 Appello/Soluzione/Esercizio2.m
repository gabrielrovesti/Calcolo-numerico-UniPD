clear all;
close all;
f=@(x) exp(x);
xmin=0;xmax=5;
toll=10^-10;
n=10;
yeval=linspace(f(xmin),f(xmax),100);
xeval=InverseFunctionPoly(f,xmin,xmax,toll,n,yeval);
figure(1);
plot(yeval,xeval);
hold on;
plot(yeval,log(yeval))
legend('inversa approssimata','inversa','location','SouthEast')
clear all
close all

a=-1;b=1;
degs=2:2:30
xplot=linspace(a,b)';
%f=@(x) sin(x.^2-1);
f=@(x) abs(x-1/2);
yplot=f(xplot);

N=401;
for n=degs
    [cN,bN,R0]=MyPolyfit(f,a,b,n,N);
    pplot=(xplot.^(0:n))*cN;
    figure(1);
    plot(xplot,yplot);
    hold on
    plot(xplot,pplot);
    hold off
    pause(0.5)
end
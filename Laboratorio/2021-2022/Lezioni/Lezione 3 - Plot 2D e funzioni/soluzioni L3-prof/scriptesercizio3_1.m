f=@(x) exp(1).^x.*(x.^2+1);
xplot=linspace(0,1);
yplot=f(xplot);
figure(10);
plot(xplot,yplot);
%%
zplot=g(xplot);
figure(10);
plot(xplot,zplot)
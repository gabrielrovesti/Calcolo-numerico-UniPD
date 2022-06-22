% problema 4
clear all
close all

f=@(x) sin(x);
a=0;b=pi;
degs=1:20;

errlin=zeros(length(degs),1);
errcheb=errlin;

xplot=linspace(a,b,1000);
yplot=f(xplot);
xeval=xplot;
yeval=yplot;

for k=1:length(degs)
    n=degs(k);
    
    xlin=linspace(a,b,n+1);
    xcheb=(a+b)/2+(b-a)/2*cos(linspace(-pi,0,n+1));
    
    ylin=f(xlin);
    ycheb=f(xcheb);
    
    coefflin=polyfit(xlin,ylin,n);
    coeffcheb=polyfit(xcheb,ycheb,n);
    
    plin=polyval(coefflin,xeval);
    pcheb=polyval(coeffcheb,xeval);
    
    errlin(k)=max(abs(yeval-plin));
    errcheb(k)=max(abs(yeval-pcheb));
    
    figure(1)
    plot(xeval,yeval,'k');
    hold on
    plot(xlin,ylin,'ob')
    plot(xcheb,ycheb,'or')
    plot(xeval,plin,'b')
    plot(xeval,pcheb,'r')
    title(['interpolazione a grado ' num2str(n)])
    hold off
    pause(1)
end

figure(2)
semilogy(errlin)
hold on
semilogy(errcheb)
legend('punti equispaziati','Cheb.-Lobatto')
% problema 5
clear all;
close all;

lastc=15;
n=20;

xinterp=linspace(-1,1,n+1);
xeval=linspace(-1,1,1000);

for c=1:lastc
    f=@(x) c./(c+x.^2);
    yinterp=f(xinterp);
    yeval=f(xeval);
    
    coef=polyfit(xinterp,yinterp,n);
    yinterpeval=polyval(coef,xeval);
    
    err(c)=max(abs(yinterpeval-yeval));
end

semilogy(1:lastc,err)
clear all
close all

f=@(x) 1./(1+x.^2);
xeval=linspace(-1,1,10000)';
yeval=f(xeval);
nmin=1;nmax=50;
E1=[];E2=[];E3=[];E4=[];
for n=nmin:nmax
    xsample=linspace(-1,1,n^2)';
    ysample=f(xsample);
    [peval1,coeff1]=MyFit(xsample,ysample,n,xeval,1);
    [peval2,coeff2]=MyFit(xsample,ysample,n,xeval,2);
    [peval3,coeff3]=MyFit(xsample,ysample,n,xeval,3);
    [peval4,coeff4]=MyFit(xsample,ysample,n,xeval,4);
    E1(n)=max(abs(yeval-peval1));
    E2(n)=max(abs(yeval-peval2));
    E3(n)=max(abs(yeval-peval3));
    E4(n)=max(abs(yeval-peval4));
end
%%
figure(1);
semilogy(E1);
hold on
semilogy(E2);semilogy(E3);semilogy(E4);
legend('LU','QR','Backslash','Polyfit/val')
title('Errori di approssimazione dei 4 metodi')
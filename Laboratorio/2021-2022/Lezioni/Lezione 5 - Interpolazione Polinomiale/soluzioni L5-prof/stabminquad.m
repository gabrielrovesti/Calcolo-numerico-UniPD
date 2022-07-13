% esperimento sulla stabilità dell'interp. con rumore bianco di campionamento 
clear all
close all


M=100;
m=1000;
n=4;N=100;
teta=0.05;
xeval=linspace(-1,1,m)';
f=@(x) x.^4;%exp(sin(x));
%%

xinterp_equi=linspace(-1,1,N)';
xinterp_cheb=cos((2*(N-1:-1:0)+1)./(2*N+1)*pi)';
yinterp_equi_true=f(xinterp_equi);
yinterp_cheb_true=f(xinterp_cheb);
yinterp_equi=yinterp_equi_true+teta*randn(N,M);
yinterp_cheb=yinterp_cheb_true+teta*randn(N,M);
yeval_true=f(xeval);
for k=1:M
    c_equi=polyfit(xinterp_equi,yinterp_equi(:,k),n);
    c_cheb=polyfit(xinterp_cheb,yinterp_cheb(:,k),n);
    yeval_equi(:,k)=polyval(c_equi,xeval);
    yeval_cheb(:,k)=polyval(c_cheb,xeval);
end
err_equi=sum(abs(yeval_equi-yeval_true)./M,2);
err_cheb=sum(abs(yeval_cheb-yeval_true)./M,2);
figure(n);
subplot(2,2,1);plot(xeval,yeval_equi,':r');
hold on
plot(xeval,yeval_true,'b','LineWidth',3);
title('ricostr. su campionamento equispaziato')
hold off
subplot(2,2,2);plot(xeval,yeval_cheb,':g');
hold on
plot(xeval,yeval_true,'b','LineWidth',3);
title('ricostr. su campionamento Chebyshev')
hold off
subplot(2,2,3);
plot(xeval,err_equi,'r','LineWidth',3);
hold on;
plot(xeval,err_cheb,'g','LineWidth',3);
title('Errori medi')
hold off
subplot(2,2,4);
plot(xeval,var(yeval_equi'),'r');
hold on
plot(xeval,var(yeval_cheb'),'g');
plot(xeval,teta^2+0.*xeval,'b');
hold off
title('Varianze dei risultati');




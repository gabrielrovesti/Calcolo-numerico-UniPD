% esperimento sulla stabilità dell'interp. con rumore bianco di campionamento 

M=1000;
m=1000;
teta=0.01;
xeval=linspace(-1,1,m)';
%%
n=12;
xinterp_equi=linspace(-1,1,n+1)';
xinterp_cheb=cos((2*(n:-1:0)+1)./(2*n+2)*pi)';
yinterp_equi_true=xinterp_equi.^n;
yinterp_cheb_true=xinterp_cheb.^n;
yeval_true=xeval.^n;
L_equi=LagrangePoly(xinterp_equi,xeval);
L_cheb=LagrangePoly(xinterp_cheb,xeval);
lambda_equi=sum(abs(L_equi),2);
lambda_cheb=sum(abs(L_cheb),2);
yinterp_equi=yinterp_equi_true+teta*randn(n+1,M);
yinterp_cheb=yinterp_cheb_true+teta*randn(n+1,M);
yeval_equi=L_equi*yinterp_equi;
yeval_cheb=L_cheb*yinterp_cheb;
err_equi=sum(abs(yeval_equi-yeval_true)./M,2);
err_cheb=sum(abs(yeval_cheb-yeval_true)./M,2);
figure(n);
subplot(3,2,1);plot(xeval,yeval_equi,':r');
hold on
plot(xeval,yeval_true,'b','LineWidth',3);
title('ricostr. su campionamento equispaziato')
hold off
subplot(3,2,2);plot(xeval,yeval_cheb,':g');
hold on
plot(xeval,yeval_true,'b','LineWidth',3);
title('ricostr. su campionamento Chebyshev')
hold off
subplot(3,2,3);
plot(xeval,err_equi,'r','LineWidth',3);
hold on;
plot(xeval,err_cheb,'g','LineWidth',3);
title('Errori medi')
hold off
subplot(3,2,4);
plot(xeval,var(yeval_equi'),'r');
hold on
plot(xeval,var(yeval_cheb'),'g');
plot(xeval,teta^2+0.*xeval,'b');
hold off
title('Varianze dei risultati');
subplot(3,2,5);semilogy(xeval,lambda_equi,'r')
subplot(3,2,6);semilogy(xeval,lambda_cheb,'g')
pause(1);




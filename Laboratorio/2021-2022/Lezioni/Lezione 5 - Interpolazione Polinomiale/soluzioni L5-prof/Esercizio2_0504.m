% esperimento sulla stabilità dell'interp. con rumore bianco di campionamento 
clear
close all
degs=1:20;
M=1000;
teta=0.001;
xeval=2;
f=@(x) exp(sin(x));
%%
err_equi=zeros(length(degs)); err_cheb=err_equi;
var_err_equi=err_equi; var_err_cheb=err_equi;
for n=degs
    xinterp_equi=linspace(-1,1,n+1)';
    xinterp_cheb=cos((2*(n:-1:0)+1)./(2*n+2)*pi)';
    yinterp_equi_true=f(xinterp_equi);
    yinterp_cheb_true=f(xinterp_cheb);
    yeval_true=f(xeval);
    L_equi=LagrangePoly(xinterp_equi,xeval);
    L_cheb=LagrangePoly(xinterp_cheb,xeval);
    lambda_equi=sum(abs(L_equi),2);
    lambda_cheb=sum(abs(L_cheb),2);
    yinterp_equi=yinterp_equi_true+teta*randn(n+1,M);
    yinterp_cheb=yinterp_cheb_true+teta*randn(n+1,M);
    yeval_equi=L_equi*yinterp_equi;
    yeval_cheb=L_cheb*yinterp_cheb;
    err_equi(n)=mean(abs(yeval_equi-yeval_true));
    err_cheb(n)=mean(abs(yeval_cheb-yeval_true));
    var_err_equi(n)=var(abs(yeval_equi-yeval_true));
    var_err_cheb(n)=var(abs(yeval_cheb-yeval_true));
end
%%
figure(1);
semilogy(degs,err_equi);
hold on
semilogy(degs,err_cheb);
legend('Errore medio equi','Errore medio Cheb');
title('medie degli errori');
figure(2);
semilogy(degs,var_err_equi);
hold on
semilogy(degs,var_err_cheb);
legend('Varianza errore equi','Varianza errore Cheb');
title('varianze degli errori')



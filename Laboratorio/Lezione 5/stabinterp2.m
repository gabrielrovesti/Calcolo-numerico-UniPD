% esperimento sulla stabilità dell'interp. con rumore bianco di campionamento 

degs=1:20;
M=100;
m=1000;
teta=0.01;
xeval=linspace(-1,1,m)';
f = @(x) exp(sin(x));
k=1;
for n = degs
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

    err_equi(k)=mean(abs(yeval_equi-yeval_true)./M,2);7
    var_equi(k)=var();
    err_cheb(k)=mean(abs(yeval_cheb-yeval_true)./M,2);
    var_cheb(k)=var();
end
figure(1);
semilogy(degs,err_cheb);
hold on 
semilogy(degs, err_equi);
legend('Errore medio Chebyshev','Errore medio nodi equispaziati');
title('Medie degli errori');

figure(2);
semilogy(degs,var_cheb);
hold on 
semilogy(degs, var_equi);
legend('Varianza Chebyshev','Varianza nodi equispaziati');
title('Medie degli errori');


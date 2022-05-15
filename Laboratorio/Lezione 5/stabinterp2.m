clear all
close all
clc
% Esperimento sulla stabilità dell'interp. con rumore bianco di campionamento 
degs=1:20;
M=100;
m=1000;
teta=0.01;
xeval=2;
f = @(x) exp(sin(x));
%%Definizione di medie e varianze per inizializzarle
avg_equi = zeros(1,length(degs));
avg_cheb = zeros(1,length(degs));
var_equi = zeros(1,length(degs));
var_cheb = zeros(1,length(degs));

k = 1;
for n = degs
    xinterp_equi=linspace(-1,1,n+1)';
    xinterp_cheb=cos((2*(n:-1:0)+1)./(2*n+2)*pi)';
    yinterp_equi_true=f(xinterp_equi);
    yinterp_cheb_true=f(xinterp_cheb);
    yeval_true=f(xeval);      %%questo si fa per f(2)

    L_equi=LagrangePoly(xinterp_equi,xeval);
    L_cheb=LagrangePoly(xinterp_cheb,xeval);

    %%Qua si calcolano le interpolazioni su tutti i nodi e su 2
    yinterp_equi=yinterp_equi_true+teta*randn(n+1,M);
    yinterp_cheb=yinterp_cheb_true+teta*randn(n+1,M);

    yeval_equi=L_equi*yinterp_equi;
    yeval_cheb=L_cheb*yinterp_cheb;

    %%Calcolo di media e di varianza pn(2, {y˜i} - f(2)
    avg_equi(k)=mean(abs(yeval_equi-yeval_true),2);
    avg_cheb(k)=mean(abs(yeval_cheb-yeval_true),2);

    var_equi(k)=var(abs(yeval_equi-yeval_true));
    var_cheb(k)=var(abs(yeval_equi-yeval_true));
end

%%I due semilog che su 20 disegnano cheb ed equi in merito a media e
%%varianza
%%Vengono vuoti, ma la logica dovrebbe essere giusta
figure(1);
semilogy(degs,avg_equi);
hold on
semilogy(degs,avg_cheb);
legend('Errore medio Equispaziati','Errore medio Chebyshev');
title('Medie degli errori µ');

figure(2);
semilogy(degs,var_equi);
hold on
semilogy(degs,var_cheb);
legend('Varianza errore Equispaziati','Varianza errore Chebyshev');
title('Varianze degli errori σ')

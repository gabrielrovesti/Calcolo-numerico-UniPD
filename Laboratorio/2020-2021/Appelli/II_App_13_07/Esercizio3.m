clear all
close all
f=@(x) sqrt(x);
a=0;b=1;
warning off
for s=1:50
    N1=2;N2=s;
    n1=s;n2=2;
    [x1,w1]=FormulaEquispaziataComposta(a,b,N1,n1);
    [x2,w2]=FormulaEquispaziataComposta(a,b,N2,n2);
    I1(s)=f(x1)*w1;
    L1(s)=sum(abs(w1));
    I2(s)=f(x2)*w2;
    L2(s)=sum(abs(w2));
end
figure(1);
semilogy(abs(I1-2/3))
hold on
semilogy(abs(I2-2/3))
title('errori di quadratura')
legend('N=2, n=1,2,..,50', 'N=1,2,...,50, n=2')
% parte facoltativa
figure(2);
semilogy(L1);
hold on
semilogy(L2)
title('fattori di stabilità')
legend('N=2, n=1,2,..,50', 'N=1,2,...,50, n=2')

fprintf('Le formule a grado alto diventano molto instabili\n')
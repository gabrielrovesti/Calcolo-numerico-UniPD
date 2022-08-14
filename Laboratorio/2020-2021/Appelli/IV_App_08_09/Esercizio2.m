clear all
close all
toll=10^-9;
for n=3:30
    A0=hilb(n);
    A=[A0(1:end-1,:);sum(A0(1:end-1,:))];
    b=A*ones(n,1);
    K(n)=rcond(A);
    [x, r, res]=MinNormLs(A,b,toll);
    myres(n)=res;
    mynorm(n)=norm(x);
    xls=lsqminnorm(A'*A,A'*b);
    matlabnorm(n)=norm(xls);
    matlabres(n)=norm(A'*A*xls-A'*b);    
end
figure(1)
plot(mynorm);
hold on
plot(matlabnorm,'--')
title("Norme");
legend("Norma MinNormLs", "Norma lsqminnorm");

figure(2)
semilogy(myres);
hold on
semilogy(matlabres,'--')
semilogy(K,'k')
title("Residui + Fattore di condizionamento");
legend("Reciproco condizionamento", "Residuo MinNormLs", "Residuo lsqmminnorm");

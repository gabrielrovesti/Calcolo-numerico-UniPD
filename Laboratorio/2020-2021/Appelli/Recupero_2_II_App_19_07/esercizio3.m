clear all;
close all;
warning off;

toll=1e-18;
for n=1:20

    % punto 1
    A=hilb(n);

    % punto 2
    Ainv=MyQRInv(A,toll);
    Kappa1(n)=MyCond(A,1,toll);

    % punto 3
    b=A*ones(1,size(A,1))';
    [L U P]=lu(A);
    xtilde=U\(L\(P*b));

    % punto 4
    [L U P]=lu(Ainv);
    xhat=U\(L\(P*b));

    % punto 5
    x=A\b;
    E1tilde(n)=norm(abs(abs(xtilde)-abs(x)),1);

    % punto 6
    E1hat(n)=norm(abs(abs(xhat)-abs(x)),1);
end
figure(1);
semilogy(eps*Kappa1);
hold on;
semilogy(E1hat);
semilogy(E1tilde);
hold off;
title('Errori e condizionamento per norma 1/infinito');
legend('eps*Kappa1','E1hat','E1tilde');
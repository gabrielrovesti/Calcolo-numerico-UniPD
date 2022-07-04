clear all
close all

f=@(x) 1./(1+x.^2);
xeval=linspace(-1,1,10000)';
yeval=f(xeval);
for n=2:50
    m=n^2;
    x=linspace(-1,1,m)';
    b=f(x);
    A=x.^(n-1:-1:0);

    % QR
    [Q0, R0]=qr(A,0);
    cqr=SostituzioneIndietro(R0,(Q0'*b));
    
    % LU
    [L,U,P]=lu(A'*A);
    clu=SostituzioneIndietro(U,SostituzioneAvanti(L,P*A'*b));
    
    % backslash
    cbackslash=A\b;
    
    % valutazione
    Aeval=xeval.^(n-1:-1:0);
    peval_qr=Aeval*cqr;
    peval_lu=Aeval*clu;
    peval_backslash=Aeval*cbackslash;
    
    % errori
    err_qr(n)=max(abs(yeval-peval_qr));
    err_lu(n)=max(abs(yeval-peval_lu));
    err_backslash(n)=max(abs(yeval-peval_backslash));
    
    % condizionamento
    kA(n)=cond(A'*A);
    kR(n)=cond(R0);
end
figure(1);
semilogy(err_qr);
hold on
semilogy(err_lu)
semilogy(err_backslash)
title('errori di approx funzione di Runge')
legend('min quadrati con QR','sol eq normali con LU', 'minimi quadrati con backslash')
xlabel('grado polinomiale')

figure(2);
semilogy(kA);
hold on
semilogy(kR);
title('condizionamenti sistemi lineari')
legend('Eq. normali','QR')
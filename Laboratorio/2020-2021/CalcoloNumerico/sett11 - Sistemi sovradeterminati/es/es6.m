clear all
close all

f=@(x) 1./(1+x.^2);
xeval=linspace(-1,1,10000)';
yeval=f(xeval);

err_qr = zeros(49,1);
err_lu = err_qr;

for n=2:50
    
    % punti 
    m = n^2;
    x=linspace(-1,1,m)';
    b=f(x);
    A=x.^(n-1:-1:0);

    % QR
    [Q0, R0]=qr(A,0);
    %cqr=R0\(Q0'*b);
    cqr=SostituzioneIndietro(R0,(Q0'*b));

    % LU
    [L, U, P] = lu(A' * A); 
    % clu = U \ (L \ (P*A'*b));
    clu = SostituzioneIndietro(U, SostituzioneAvanti(L,P*A'*b));

    % valutazione
    Aeval=xeval.^(n-1:-1:0);
    peval_qr = Aeval*cqr;
    peval_lu = Aeval*clu;
    
    % errori
    err_qr(n-1) = max(abs(yeval-peval_qr));
    err_lu(n-1) = max(abs(yeval-peval_lu));
end

figure(1)
semilogy(err_qr);
hold on
semilogy(err_lu)
title('errori di approx funzione di Runge')
legend('min quadrati con QR','sol eq normali con LU' )
xlabel('grado polinomiale')
clear all
close all
eps=10^-15;
for n=2:20
    x=linspace(-1,1,n);
    A=vander(x)+eps*eye(n);
    b=A*ones(n,1);
    [Lnopiv, Unopiv] = LUnoPiv(A);
    [L, U, P]=lu(A);
    xnopiv=SostituzioneIndietro(Unopiv,SostituzioneAvanti(Lnopiv,b));    
    xpiv=SostituzioneIndietro(U,SostituzioneAvanti(L,P*b));
    xbackslash=A\b;
    errnopiv(n)=norm(ones(n,1)-xnopiv)/norm(ones(n,1));
    errpiv(n)=norm(ones(n,1)-xpiv)/norm(ones(n,1));
    errbackslash(n)=norm(xbackslash-ones(n,1))/norm(ones(n,1));
    resnopiv(n)=norm(A*xnopiv-b)/norm(b);
    respiv(n)=norm(A*xpiv-b)/norm(b);
    K(n)=cond(A);
    resbackslash(n)=norm(A*xbackslash-b)/norm(b);
end
%%
figure(1);
semilogy(errnopiv)
hold on
semilogy(errpiv)
semilogy(errbackslash)
semilogy(resnopiv)
semilogy(respiv)
semilogy(resbackslash)
semilogy(K)
grid on
legend('err rel lu senza pivoting','err rel lu con pivoting','err rel backslash',...
    'res rel lu senza pivoting','res rel lu con pivoting','res rel backslash',...
    'cond(A)')
title('Confronto degi errori sulla soluzione')

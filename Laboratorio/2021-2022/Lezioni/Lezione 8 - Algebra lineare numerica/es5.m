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
    errnopiv(n)=norm(ones(n,1)-xnopiv);
    errpiv(n)=norm(ones(n,1)-xpiv);
    errbackslash(n)=norm(xbackslash-ones(n,1));
    resnopiv(n)=norm(A*xnopiv-b);
    respiv(n)=norm(A*xpiv-b);
    normA1(n)=norm(Inv(A));
    resbackslash(n)=norm(A*xbackslash-b);
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
semilogy(normA1)
grid on
legend('err ass lu senza pivoting','err ass lu con pivoting','err ass backslash',...
    'res ass lu senza pivoting','res ass lu con pivoting','res ass backslash',...
    'norm(inv(A))','Location','NorthWest')
title('Confronto degi errori sulla soluzione')

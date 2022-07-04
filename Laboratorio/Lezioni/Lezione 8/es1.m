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
    errnopiv(n)=norm(ones(n,1)-xnopiv);
    errpiv(n)=norm(ones(n,1)-xpiv);
    errfattUnopiv(n)=norm(Unopiv-triu(Unopiv));
    errfattU(n)=norm(U-triu(U));
end
%%
figure(1);
semilogy(errnopiv)
hold on
semilogy(errpiv)
grid on
legend('lu senza pivoting','lu con pivoting')
title('Confronto degi errori sulla soluzione')
figure(2);
semilogy(errfattUnopiv)
hold on
semilogy(errfattU)
title('confronto degli errori sulla fattorizzazione')
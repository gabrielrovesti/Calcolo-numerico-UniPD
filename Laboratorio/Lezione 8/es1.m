dim = (2:20);
eps=10^(-15);

err = zeros(length(dim),1);
err_sol1=err;
err_norm=err;

k=1;
for n=dim
    z=linspace(-1,1,n);
    V=vander(z);
    A = V+randn(size(V))*eps;
    xvero=ones(size(V,1),1);
    b=A*xvero;
    
    [Lp,Up,Pp]=lu(A);
    xa=SostituzioneAvanti(Lp,Pp*b);
    xb=SostituzioneIndietro(Up,xa);

    [L, U] = LUnoPiv(A);
    ya=SostituzioneAvanti(L,b);
    yb=SostituzioneIndietro(U,ya);

    err(k)=norm(xvero-yb);
    err_sol1(k)=norm(xvero-xb);
    err_norm(k)=norm(U-triu(U));
    k=k+1;
end

figure(1)
semilogy(dim, err);
hold on
semilogy(dim, err_sol1);
title('Confronto degi errori sulla soluzione')
legend('lu senza pivoting', 'lu con pivoting');
hold off

figure(2)
semilogy(dim, err_norm);
title('confronto degli errori sulla fattorizzazione');
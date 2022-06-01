dim = (2:20);
eps=10^(-15);

err = zeros(length(dim),1);
err_sol1=err;
err_norm=err;
err_back=err;

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

    ya_back=mldivide(A, b);

    err(k)=mean(abs(xvero-yb));
    err_sol1(k)=mean(abs(xvero-xb));
    err_norm(k)=norm(U-triu(U));
    err_back(k)=mean(abs(xvero-ya_back));
    k=k+1;
end

figure(1)
semilogy(dim, err);
grid on
hold on
semilogy(dim, err_sol1);
grid on
semilogy(dim, err_back)
grid on
title('Confronto degi errori sulla soluzione')
legend('lu senza pivoting', 'lu con pivoting', 'backslash');
hold off

figure(2)
semilogy(dim, err_norm);
grid on
title('confronto degli errori sulla fattorizzazione');


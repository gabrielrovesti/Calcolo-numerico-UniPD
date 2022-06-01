dim = (2:20);
eps=10^(-15);

%Errori relativi
err = zeros(length(dim),1);
err_sol1=err;
err_norm=err;
err_back=err;

%Residui
res=err;
resx=err;
resy=err;

%Fattore di condizionamento
c=err;

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

    y_back=mldivide(A, b);

    %Gli errori relativi si calcolano
    %sulle norme (va fatto così)
    %prendendo come riferimento
    %la soluzione della sost.all'indietro
    %e l'intervallo di calcolo
    err(k)=norm(xb-xvero)/norm(xvero);
    err_sol1(k)=norm(yb-xvero)/norm(xvero);
    err_back(k)=norm(y_back-xvero)/norm(y_back);

    %Il residuo è quello che sta sulla slide
    res(k)=norm(A*xb-b)/norm(b);
    resx(k)=norm(A*yb-b)/norm(b);
    resy(k)=norm(A*y_back)/norm(b);

    %k(A)
    c(k)=cond(A);
    k=k+1;
end

figure(1)
semilogy(dim, err);
hold on
semilogy(dim, err_sol1);
semilogy(dim, err_back);
semilogy(dim, res);
semilogy(dim, resx);
semilogy(dim, c);

legend('err rel lu senza pivoting','err rel lu con pivoting','err rel backslash',...
    'res rel lu senza pivoting','res rel lu con pivoting','res rel backslash','cond');
title('Confronto degli errori sulla soluzione');
hold off


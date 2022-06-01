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

    y_back=A\b;

    %Calcolo errori assoluti
    %si noti che non hanno il rapporto
    err(k)=norm(xb-xvero);
    err_sol1(k)=norm(yb-xvero);
    err_back(k)=norm(y_back-xvero);

    %Calcolo residui
    res(k)=norm(A*xb-b);
    resx(k)=norm(A*yb-b);
    resy(k)=norm(A*y_back);

    %k(A)
    c(k)=norm(Inv(A));
    k=k+1;
end

figure(1)
semilogy(dim,err);
hold on
semilogy(dim,errp);
semilogy(dim,errb);
semilogy(dim,res);
semilogy(dim,resp);
semilogy(dim,resb);
semilogy(dim,c);
legend('err ass lu senza pivoting','err ass lu con pivoting','err ass backslash',...
    'res ass lu senza pivoting','res ass lu con pivoting','res ass backslash','norm(Inv(A))');
title('Confronto degli errori sulla soluzione');
hold off



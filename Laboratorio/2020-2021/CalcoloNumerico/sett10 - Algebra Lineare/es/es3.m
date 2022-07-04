clear all;
close all;

epsilon = 10^-15;
dim = (2:20);

calcerr = @(x,xvero) norm(x - xvero)/norm(xvero);
calcres = @(A,b,x) norm(A*x-b)/norm(b);

err = zeros(length(dim),1);
errp = err;
errb = err;

res = err;
resp = res;
resb = res;

c = res;

k = 1;
for n = dim
    z = linspace(-1,1,n);
    V = vander(z);
    A = V + randn(size(V))*epsilon;
    xvero = ones(size(V,1),1);
    b = A * xvero;
    
    [Lp,Up,Pp] = lu(A);
    yp = SostituzioneAvanti(Lp,Pp*b);
    xp = SostituzioneIndietro(Up,yp);
    
    [L,U] = LUnoPiv(A);
    y = SostituzioneAvanti(L,b);
    x = SostituzioneIndietro(U,y);
    
    xb = A\b;
    
    err(k) = calcerr(x,xvero);
    errp(k) = calcerr(xp,xvero);
    errb(k) = calcerr(xb,xvero);

    % calcola i residui e il condizionamento
    res(k) = calcres(A,b,x);
    resp(k) = calcres(A,b,xp);
    resb(k) = calcres(A,b,xb);

    c(k) = cond(A);

    k = k +1;
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
legend('err rel lu senza pivoting','err rel lu con pivoting','err rel backslash',...
'res rel lu senza pivoting','res rel lu con pivoting','res rel backslash','cond');
title('Confronto degli errori sulla soluzione');
hold off
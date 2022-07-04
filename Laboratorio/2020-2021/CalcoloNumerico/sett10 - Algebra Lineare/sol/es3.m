clear all;
close all;

epsilon = 10^-15;
dim = (2:20);

err = zeros(length(dim),1);
errp = err;
errb = err;

res = err;
resp = res;
resb = res;

c = err;

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
    
    err(k) = norm(x-xvero)/norm(xvero);
    errp(k) = norm(xp-xvero)/norm(xvero);
    errb(k) = norm(xb-xvero)/norm(xvero);
    
    res(k) = norm(A*x - b)/norm(b);
    resp(k) = norm(A*xp - b)/norm(b);
    resb(k) = norm(A*xb - b)/norm(b);
    
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
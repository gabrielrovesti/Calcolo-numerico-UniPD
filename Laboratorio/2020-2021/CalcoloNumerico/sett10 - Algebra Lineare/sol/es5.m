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
    
    err(k) = norm(x-xvero);
    errp(k) = norm(xp-xvero);
    errb(k) = norm(xb-xvero);
    
    res(k) = norm(A*x - b);
    resp(k) = norm(A*xp - b);
    resb(k) = norm(A*xb - b);
    
    c(k) = norm(Inv(A));
    
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

legend('err ass lu senza pivoting','err ass lu con pivoting','err ass backslash',...
    'res ass lu senza pivoting','res ass lu con pivoting','res ass backslash','norm(Inv(A))');
title('Confronto degli errori sulla soluzione');
hold off
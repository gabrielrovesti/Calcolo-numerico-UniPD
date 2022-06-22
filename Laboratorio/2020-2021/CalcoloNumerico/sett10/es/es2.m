clear all;
close all;

epsilon = 10^-15;
dim = (2:20);

err = zeros(length(dim),1);
errp = err;
errb = err;

k = 1;
for n = dim
    % creazione matrici e vettore soluzione
    z = linspace(-1,1,n);
    V = vander(z);
    A = V + randn(size(V))*epsilon;
    xvero = ones(size(V,1),1);
    b = A * xvero;
    
    % calcolo di L, U, P e soluzione del sistema
    [Lp,Up,Pp] = lu(A);
    yp = SostituzioneAvanti(Lp,Pp*b);
    xp = SostituzioneIndietro(Up,yp);
    
    [L,U] = LUnoPiv(A);
    y = SostituzioneAvanti(L,b);
    x = SostituzioneIndietro(U,y);
    
    xb = A\b;

    % calcolo di errori
    err(k) = mean(abs(xvero-x));
    errp(k) = mean(abs(xvero-xp));
    errb(k) = mean(abs(xvero-xb));
        
    k = k +1;
end

figure(1)
semilogy(dim,err);
hold on
semilogy(dim,errp);
semilogy(dim,errb);
legend('lu senza pivoting','lu con pivoting','backslash');
title('Confronto degli errori sulla soluzione');
hold off
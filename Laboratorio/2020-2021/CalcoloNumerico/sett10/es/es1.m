clear all;
close all;

epsilon = 10^-15;
dim = (2:20);

err = zeros(length(dim),1);
errp = err;
fatt = err;

k = 1;
for n = dim
    % creazione matrici e vettore soluzione
    z = linspace(-1,1,n);
    V = vander(z);
    A = V + randn(size(V))*epsilon;
    xvero = ones(size(A,1),1);
    b = A * xvero;
    
    % calcolo di L, U, P e soluzione del sistema
    [Lp,Up,Pp] = lu(A);
    yp = SostituzioneAvanti(Lp,Pp*b);
    xp = SostituzioneIndietro(Up,yp);

    [L,U] = LUnoPiv(A);
    y = SostituzioneAvanti(L,b);
    x = SostituzioneIndietro(U,y);

    % calcolo di errori e fattori
    err(k) = mean(abs(xvero-x));
    errp(k) = mean(abs(xvero-xp));
    fatt(k) = norm(U-triu(U));

    k = k+1;
end

% Grafici
figure(1)
semilogy(dim,err)
hold on
semilogy(dim,errp)
legend('lu senza pivoting','lu con pivoting');
title('Confronto degli errori sulla soluzione');
hold off

figure(2)
semilogy(dim,fatt)
title('Confronto degli errori sulla fattorizzazione');
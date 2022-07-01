clear
close all
versione = 1;
switch versione
    case 1 
        a=0; b=1;
        f=@(x) x;
        intvero=1;
    case 2
        a=1; b=2;
        f=@(x) x.^2/2 + 1;
        intvero=4.5;
end

ks=1:100;
Ip=zeros(1,length(ks));
h=(b-a)./(2*ks);

for k=ks
    N=2*k;
    [xp,wp]=Parabole(a,b,N);
    Ip(k)=wp*f(xp);
end

figure(1);
semilogy(2*ks+1,abs(intvero-Ip),'b');
legend('Errore parabole')
title(['Errori di quadratura di f'])
xlabel('Numero punti di quadratura')
hold off

clear
close all
ver = 1;
switch ver
    case 1 
        a=0; b=sqrt(2);
        f=@(x) 2 + sqrt(sqrt(2)-x);
        intvero=sqrt(2);
    case 2
        a=sqrt(2); b=2;
        f=@(x) x.^2/2 + 1;
        intvero=1;
end

ks=1:100;
It=zeros(1,length(ks));
h=(b-a)./(2*ks);

for k=ks
    N=2*k;
    [xt,wt]=Trapezi(a,b,2*N);
    It(k)=wt*f(xt);
end

figure(1);
semilogy(2*ks+1,abs(intvero-It),'b');
legend('Errore trapezi')
title(['Errori di quadratura di f'])
xlabel('Numero punti di quadratura')
hold off

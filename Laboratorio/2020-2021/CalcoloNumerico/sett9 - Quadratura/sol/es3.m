clear all
close all
f=@(x) sin(x);
a=0;b=pi/2;
intvero=1;

%%
ks=1:30;
Il=zeros(1,length(ks));
Ic=Il;
It=Ic;
Ip=It;
h=(b-a)./(2*ks);

%%
for k=ks
    N=2*k;
    xequi = linspace(a,b,N+1)';
    xcheb = (a+b)/2+(b-a)/2*cos((2*(N-1:-1:0)+1)./(2*N+1)*pi)';
    [wl,Wl,fl]=FormulaInterpolatoria(xequi,a,b,10^-15,100);
    [wc,Wc,fc]=FormulaInterpolatoria(xcheb,a,b,10^-15,100);
    [xt,wt]=Trapezi(a,b,2*N);
    [xp,wp]=Parabole(a,b,N);
    Il(k)=wl*f(xequi);
    Ic(k)=wc*f(xcheb);
    It(k)=wt*f(xt);
    Ip(k)=wp*f(xp);
end

figure(1);
semilogy(2*ks+1,abs(intvero-It),'b');hold on
semilogy(2*ks+1,abs(intvero-Il),'g');
semilogy(2*ks+1,abs(intvero-Ip),'r');
semilogy(2*ks+1,abs(intvero-Ic),'k');
legend('err trap','err equi','err parab', 'err cheb')
title(['Errori di quadratura di f su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off

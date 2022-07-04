clear all
close all
f=@(x) x;
a=-1;b=1;
intvero=0;

%%
ks=1:30;
Ie=zeros(1,length(ks));
Ic=Ie;

stabe = zeros(1,length(ks)) ;
stabc = stabe ;
%%
for k=ks
    N=2*k;
    xequi=linspace(a,b,2*N+1)';
    xcheb=(a+b)/2+(b-a)/2*cos((2*(2*N:-1:0)+1)./(2*2*N+2)*pi)';
    
    [we,We,fe]=FormulaInterpolatoria(xequi,a,b,10^-15,100);
    [wc,Wc,fc]=FormulaInterpolatoria(xcheb,a,b,10^-15,100);

    epsilon=1e-8*randn(2*N+1,1);

    Ie(k)=we*(f(xequi)+epsilon);
    Ic(k)=wc*(f(xcheb)+epsilon);

    stabe(k) = sum(abs(we.*epsilon)) / abs(sum(we.*epsilon));
    stabc(k) = sum(abs(wc.*epsilon)) / abs(sum(wc.*epsilon));
end

figure(1);
semilogy(2*ks+1,abs(intvero-Ie),'g');hold on
semilogy(2*ks+1,abs(intvero-Ic),'k');
semilogy(2*ks+1,stabe,'g--o');
semilogy(2*ks+1,stabc,'k--');
legend('err equi','err cheb','kappa*eps equi', 'kappa*eps cheb')
title(['Errori di quadratura di f su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off
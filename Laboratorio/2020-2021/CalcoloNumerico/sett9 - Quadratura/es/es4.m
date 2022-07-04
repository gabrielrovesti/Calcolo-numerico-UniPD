clear all
close all
f=@(x) sin(x);
a=0;b=pi/2;
intvero=1;

%%
ks=1:30;
It=zeros(1,length(ks));
Ip=It;
Ie=It;
Ic=It;

stabt = zeros(1,length(ks));
stabp = stabt;
stabe = stabt ;
stabc = stabt ;
%%
for k=ks
    N=2*k;
    xequi=linspace(a,b,2*N+1)';
    xcheb=(a+b)/2+(b-a)/2*cos((2*(2*N:-1:0)+1)./(2*2*N+2)*pi)';
    
    [xt,wt]=Trapezi(a,b,2*N);
    [xp,wp]=Parabole(a,b,N);
    [we,We,fe]=FormulaInterpolatoria(xequi,a,b,10^-15,100);
    [wc,Wc,fc]=FormulaInterpolatoria(xcheb,a,b,10^-15,100);

    epsilon=1e-8*randn(2*N+1,1);
    It(k)=wt*(f(xt)+epsilon);
    Ip(k)=wp*(f(xp)+epsilon);
    Ie(k)=we*(f(xequi)+epsilon);
    Ic(k)=wc*(f(xcheb)+epsilon);

    stabt(k) = sum(abs(wt)) / abs(sum(wt)) ;
    stabp(k) = sum(abs(wp)) / abs(sum(wp)) ;
    stabe(k) = sum(abs(we)) / abs(sum(we)) ;
    stabc(k) = sum(abs(wc)) / abs(sum(wc)) ;
end

figure(1);
semilogy(2*ks+1,abs(intvero-It),'b');hold on
semilogy(2*ks+1,abs(intvero-Ie),'g');
semilogy(2*ks+1,abs(intvero-Ip),'r');
semilogy(2*ks+1,abs(intvero-Ic),'k');
legend('err trap','err equi','err parab', 'err cheb')
title(['Errori di quadratura di f su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off

figure(2);
semilogy(2*ks+1,stabt,'b');hold on
semilogy(2*ks+1,stabe,'g');
semilogy(2*ks+1,stabp,'r');
semilogy(2*ks+1,stabc,'k');
legend('stab trap','stab equi','stab parab', 'stab cheb')
title(['Fattori di stabilita su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off;
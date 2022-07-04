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

stabt = zeros(1,length(ks));
stabp = stabt;
stabl = stabt;
stabc = stabt;

%%
for k=ks
    N=2*k;
    xequi = linspace(a,b,2*N+1)';
    xcheb = (a+b)/2+(b-a)/2*cos((2*(2*N:-1:0)+1)./(2*2*N+2)*pi)';
    [wl,Wl,fl]=FormulaInterpolatoria(xequi,a,b,10^-15,100);
    [wc,Wc,fc]=FormulaInterpolatoria(xcheb,a,b,10^-15,100);
    [xt,wt]=Trapezi(a,b,2*N);
    [xp,wp]=Parabole(a,b,N);
    epsilon=1e-8*randn(2*N+1,1);
    Il(k)=wl*(f(xequi)+epsilon);
    Ic(k)=wc*(f(xcheb)+epsilon);
    It(k)=wt*(f(xt)+epsilon);
    Ip(k)=wp*(f(xp)+epsilon);
    
    stabt(k) = sum(abs(wt))/abs(sum(wt));
    stabp(k) = sum(abs(wp))/abs(sum(wp));
    stabl(k) = sum(abs(wl))/abs(sum(wl));
    stabc(k) = sum(abs(wc))/abs(sum(wc));
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

figure(2)
semilogy(2*ks+1,stabt,'b');hold on
semilogy(2*ks+1,stabl,'g');
semilogy(2*ks+1,stabp,'r');
semilogy(2*ks+1,stabc,'k');
legend('fattore trap','fattore equi','fattore parab', 'fattore cheb')
title(['Fattori di stabilita di f su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off
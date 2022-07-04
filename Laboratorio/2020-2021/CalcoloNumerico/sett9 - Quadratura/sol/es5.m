clear all
close all

f=@(x) x;
a=-1;b=1;
intvero=0;

%%
ks=1:30;
Il=zeros(1,length(ks));
Ic=Il;
h=(b-a)./(2*ks);

stabl = zeros(1,length(ks));
stabc = stabl;

%%
for k=ks
    N=2*k;
    xequi = linspace(a,b,2*N+1)';
    xcheb = (a+b)/2+(b-a)/2*cos((2*(2*N:-1:0)+1)./(2*2*N+2)*pi)';
    [wl,Wl,fl]=FormulaInterpolatoria(xequi,a,b,10^-15,100);
    [wc,Wc,fc]=FormulaInterpolatoria(xcheb,a,b,10^-15,100);
    epsilon=1e-8*randn(2*N+1,1);
    Il(k)=wl*(f(xequi)+epsilon);
    Ic(k)=wc*(f(xcheb)+epsilon);

    stabl(k) = sum(abs(wl))/abs(sum(wl));
    stabc(k) = sum(abs(wc))/abs(sum(wc));
end

figure(1);
semilogy(2*ks+1,abs(intvero-Il),'g');hold on
semilogy(2*ks+1,abs(intvero-Ic),'k');
semilogy(2*ks+1,stabl,'g--');
semilogy(2*ks+1,stabc,'k--');
legend('err equi', 'err cheb','fattore equi', 'fattore cheb')
title(['Errori di quadratura e fattori di stabilita di f su [-1,1]'])
xlabel('num punti di quadratura')
hold off
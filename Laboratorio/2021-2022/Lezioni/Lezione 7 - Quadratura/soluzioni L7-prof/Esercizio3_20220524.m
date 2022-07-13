clear all
close all
f=@(x) sin(x);
a=0;b=pi/2;
intvero=1;

% f=@(x)abs(x);
% a=-2;b=1;
% intvero=2.5;

% alpha=1.1;
% f=@(x)abs(x).^alpha;
% a=-sqrt(2);b=1;
% intvero=1/(alpha+1)*(b^(alpha+1)+(-a)^(alpha+1));
%%
ks=1:30;
It=zeros(1,length(ks));Ip=It;
h=(b-a)./(2*ks);
Nmax=1000;
toll=10^-7;
%%
for k=ks
    N=k;
    [xt,wt]=Trapezi(a,b,2*N);
    [xp,wp]=Parabole(a,b,N);
    n=length(xp)-1;
    xequi=linspace(a,b,n+1)';
    xcheb=(a+b)/2+(b-a)/2*cos((2*(n-1:-1:0)+1)./(2*n+1)*pi)';
    wequi=FormulaInterpolatoria(xequi,a,b,toll,Nmax);
    wcheb=FormulaInterpolatoria(xcheb,a,b,toll,Nmax);
    It(k)=wt*f(xt);
    Ip(k)=wp*f(xp);
    Iequi(k)=wequi*f(xequi);
    Icheb(k)=wcheb*f(xcheb);
end

figure(1);
semilogy(2*ks+1,abs(intvero-It),'b');hold on
semilogy(2*ks+1,abs(intvero-Iequi),'g')
%semilogy(2*ks+1,h.^2,'--b');
semilogy(2*ks+1,abs(intvero-Ip),'r');
semilogy(2*ks+1,abs(intvero-Icheb),'k')
%semilogy(2*ks+1,h.^4,'--r');
legend('err trap','err equi','err parab', 'err cheb')
title(['Errori di quadratura di f su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off

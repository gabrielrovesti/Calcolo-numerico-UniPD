clear all
close all
f=@(x) sin(x);
a=0;b=pi/2;
intvero=1;

% f=@(x)abs(x);
% a=-2;b=1;
% intvero=2.5;

alpha=1.04;
f=@(x)abs(x).^alpha;
a=-sqrt(2);b=sqrt(3);
intvero=1/(alpha+1)*(b^(alpha+1)+(-a)^(alpha+1));
%%
ks=1:15;
It=zeros(1,length(ks));Ip=It;
h=(b-a)./(2*ks);
%%
for k=ks
    N=2*k;
    [xt,wt]=Trapezi(a,b,2*N);
    [xp,wp]=Parabole(a,b,N);
    It(k)=wt*f(xt);
    Ip(k)=wp*f(xp);
end

figure(1);
semilogy(2*ks+1,abs(intvero-It),'b');
hold on
semilogy(2*ks+1,h.^2,'--b');
semilogy(2*ks+1,abs(intvero-Ip),'r');
semilogy(2*ks+1,h.^4,'--r');
legend('err trap','h^2','err parab', 'h^4')
title(['Errori di quadratura di f su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off

clear all;
close all;

f=@(x) x.^(1.1);
a=-1*sqrt(2);
b=sqrt(3);
intvero=1;
ks=1:15;
It=zeros(1,length(ks));
Ip=It;
h=(b-a)./(2*ks);
for i=ks
    [x,w]=Trapezi(a,b,2*i);
    [r,s]=Parabole(a,b,i);
    It(i)=w*f(x);
    Ip(i)=s*f(r);
end
figure(1);
semilogy(2*ks+1, abs(intvero-It),'b');
hold on
semilogy(2*ks+1, h.^2,'--b');
semilogy(2*ks+1, abs(intvero-Ip),'p');
semilogy(2*ks+1, h.^4,'--r');
hold off
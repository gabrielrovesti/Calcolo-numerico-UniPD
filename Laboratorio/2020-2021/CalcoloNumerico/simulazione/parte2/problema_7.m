clear all
clc
close all

ks=1:20;
d1=zeros(length(ks)); d2=d1;
for n=ks
    xcheb=0.5*cos((0:n)./n*pi);
    V=xcheb.^(0:n);
    G=V * V';
    d1(n)=det(G)^(1/n);
    d2(n)=mysymdet(G)^(1/n);
end

figure(1)
plot(d1, 'r-');
hold on
plot(d2,'r--')
title("Determinanti");
legend("Determinante Matlab", "Determinante Custom");
hold off


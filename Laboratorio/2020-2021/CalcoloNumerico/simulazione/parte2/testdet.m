clear
close all
clc
ks=1:10;
d1=zeros(length(ks)); d2=d1;

for n=ks
    H=hilb(n);
    d1(n)=det(H);
    d2(n)=mydet(H);
end

figure(1)
plot(d1, 'r-');
hold on
plot(d2,'r--')
title("Determinanti");
legend("Determinante Matlab", "Determinante Custom");
hold off
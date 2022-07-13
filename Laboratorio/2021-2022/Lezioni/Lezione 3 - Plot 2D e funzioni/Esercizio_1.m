clear all
x=linspace(0,1); %100 è già implicito
f=@(x) exp(x).*(x.^2+1);
z=f(x);
y=g(x);

plot(x,y,x,z);
title('Figura 10: Funzioni z ed y');
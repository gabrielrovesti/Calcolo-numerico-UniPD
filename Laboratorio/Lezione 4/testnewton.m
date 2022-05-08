clear all

x=linspace(0,1);
f=@(x) sin(x);
df=@(x) diff(f(x));
y=f(x);
toll=1*10^(-9);
itmax=ceil(log2(1-0)-log2(toll));
[res, iter]=mynewton(f(x),df(x),x,toll,itmax);


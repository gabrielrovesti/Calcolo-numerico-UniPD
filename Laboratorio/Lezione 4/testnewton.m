clear all

x=linspace(0,1);
f=@(x) sin(x);
y=f(x);
z=@(y) diff(y);
df=z(y);
toll=1*10^(-9);
itmax=ceil(log2(1-0)-log2(toll));
[res, iter]=mynewton(f(x),df,x,toll,itmax);


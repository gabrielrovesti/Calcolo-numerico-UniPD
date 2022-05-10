clear all

x=linspace(0,1);
f=@(x) sin(x);
df=@(x) cos(x);
toll=1*10^(-9);
itmax=100;
res=mynewton(f(x),df(x),x,toll,itmax);


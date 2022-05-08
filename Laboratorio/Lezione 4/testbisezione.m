clear all

a=-(pi/6);
b=pi/4;
x=linspace(0,1);
f=@(x) sin(x);
y=f(x);
toll=1*10^(-9);
mybisezione(a,b,f(x),toll);

clear
close all
clc
warning off
% definizione di a, b, x
a=-(pi/6);
b=pi/4;
x=linspace(0,1);
% function handle di x
f=@(x) sin(x);
toll=1*10^(-9);
zero=mybisezione(a,b,f(x),toll);	 % chiamata a mybisezione

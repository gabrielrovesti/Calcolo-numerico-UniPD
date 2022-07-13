clear
close all
clc
warning off
x=linspace(0,1);	% Definizione dello spazio vettoriale
f=@(x) sin(x);	% Function handle sulla funzione seno e derivata (coseno)
df=@(x) cos(x);
toll=1*10^(-9);
itmax=100;
[zero, iterates]=mynewton(f(x),df(x),x,toll,itmax);	% Chiamata a mynewton 

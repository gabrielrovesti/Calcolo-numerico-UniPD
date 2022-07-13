clear all;
close all;
clc;

%%Definizione del vettore e della funzione
x = linspace(0,1,100);
f = @(x) exp(x).*(x.^2 + 1);

%%Richiamo di PlotAsIWant con f e g su due figure separate
PlotAsIWant(x,f,10,'Plot','bo-','PlotName','e')
hold on
PlotAsIWant(x,@g,10,'Plot','g.--','PlotName','e')
hold off

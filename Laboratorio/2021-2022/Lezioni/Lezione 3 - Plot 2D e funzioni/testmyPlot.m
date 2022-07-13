clear
close all
clc
warning off

x=randn(100000,1);
y=randn(100000,1);
str=myPlot(x,y,'figura di prova',1,'punti gaussiani','x random','y random')
disp(str);
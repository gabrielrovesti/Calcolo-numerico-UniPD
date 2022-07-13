clear
close all
clc
warning off

N=100; % Numero di sottointervalli
a=-1; b=1; % Estremi di integrazione
x=linspace(a,b,N+1)'; % Formula dei trapezi
f=@(x) exp(-1./(1-abs(x)));
w=(b-a)/N*[1/2,ones(1,N-1),1/2];
It=w*f(x);
% Approssimazione dell’integrale (presumo sia questa almeno) a 12 cifre decimali;
% da quello che ho capito, il ciclo non serve, farebbe una stampa 100 volte
% Infatti, avendo N=100 sottointervalli, è sufficiente scrivere la formula
fprintf("Approssimazione integrale: %1.12f \n", It);

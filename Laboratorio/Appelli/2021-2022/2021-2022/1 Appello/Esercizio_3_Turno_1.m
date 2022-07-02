clear
close all
clc
N=100; % numero di sottointervalli
a=-1; b=1; % estremi di integrazione
intvero=4.06;   % calcolo dell'integrale sugli estremi a e b
x=linspace(-1,1,2*N+1)'; % formula dei trapezi adattata ad i per il ciclo
f=@(x) exp(1).^(-1./(1-x.^2));
w=(b-a)/2*N*[1/2,ones(1,2*N-1),1/2];
It=w*f(x);
% Approssimazione dell’integrale a 12 cifre decimali;
% da quello che ho capito, il ciclo non serve, farebbe una stampa 100 volte
% Infatti, avendo N=100 sottointervalli, è sufficiente scrivere la formula
fprintf("Approssimazione integrale: %1.12f \n", abs(intvero - It));

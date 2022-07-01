clear
clc
close all
a=0; b= pi/4; 
x = linspace(a,b, 100); 
f = @(x) sin(x);
n = 1:10;
I = integralfit(a, b, x, f, n);
intvero = 1 - 1/(sqrt(2));
figure(1);
semilogy(2*n+1,abs(intvero-I),'b');
legend('Errore integral fit')
xlabel('Numero punti di quadratura')

hold off

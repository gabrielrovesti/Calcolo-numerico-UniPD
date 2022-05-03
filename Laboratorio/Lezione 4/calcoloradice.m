clear all

%%si definisce la anonymous function
%%dopodiché si definisce il plot prima
%%di una funzione poi della retta y=0
x=linspace(1,2);
y=0;
f=@(x) (x.^2-2);
z=f(x);
%{
figure(1);
plot(x, z);

hold on
plot(x, y);
hold off
%}

%%si calcola lo zero chiamando la bisezione
%%stampando a video come richiesto
[zero,wres]=Bisezione(f,1,2,10^(-12),'m');
fprintf("Ultimo risultato approssimazione: %d\n", zero);

%%successivamente dobbiamo creare un grafico
%%semilogaritmico (si usa semilogy(x,y))
%%e l'errore delle iterate deriva dalla sottrazione di
%%un valore per il precedente, questo per ogni iterata
%%mentre il modulo dei residui deriva da "wres"
%%della funzione chiamata "Bisezione"

figure(2)
%%errore iterata = b - a / 2^itmax
itmax=ceil(log2(2-1)-log2(10^(-12)));
err_iterates=(2-1)/2^itmax;
semilogy(err_iterates, wres);
%%Idea di implementazione per il rapporto errori vs moduli residui e la
%%retta che vale 1/f'(radice di 2) che diventa 
%%1 su 2 radice di 2
error_ratio = err_iterates / (1/2*sqrt(2));




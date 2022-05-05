clear all
%%definizione di x
%%e delle function handle
x=linspace(1,2);
f1=@(x) (x.^2 - 2);
f3=@(x) (x.^2 - 2).^3;
f5=@(x) (x.^2 - 2).^5;

%%definizione delle derivate
%%prime tramite anonymous functions
df1=@(x) diff(f1(x));
df3=@(x) diff(f3(x));
df5=@(x) diff(f5(x));

%%Definizione di tutti i grafici con
%%funzioni, derivate, legenda e titolo
plot(x,f1(x),x,df1(x));
title('Grafico 1');
legend('f1(x)', 'df1(x)');

plot(x,f3(x),x,df3(x));
title('Grafico 2');
legend('f3(x)', 'df3(x)');

plot(x,f5(x),x,df5(x));
title('Grafico 3');
legend('f5(x)', 'df5(x)');

%%Approssimazione della soluzione sqrt(2)
%%con f_m(x)=0 nei casi m=1,3,5 chiamando il metodo di Newton
%%con il criterio dello scarto

%%function [zero,res,iterates,flag]=Newton(f,df,x0,toll,itmax,method)
[zero1,res1,iterates1]=Newton(f1(x),df1(x),2,10^(-8),100,'m');

[zero2,res2,iterates2]=Newton(f3(x),df3(x),2,10^(-8),100,'m');

[zero3,res3,iterates3]=Newton(f5(x),df5(x),2,10^(-8),100,'m');

%%L'errore dello scarto dovrebbe essere l'iterata stessa
%%(ultimo termine della successione) ed il penultimo termine
error_1=iterates1 - (iterates1 - 1);
semilogy(f1(x),res1,error_1);

error_2=iterates2 - (iterates2 - 1);
semilogy(f3(x),res2,error_2);

error_3=iterates3 - (iterates3 - 1);
semilogy(f5(x),res3,error_3);

%%Punti 4 e 5 non ne ho idea
%%comunque dai plot in poi non è giusto


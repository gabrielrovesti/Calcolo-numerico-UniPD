clear all
%%definizione di x
%%e delle function handle
x=linspace(1,2);
f1=@(x) exp(1 - 1/x) - e + 0.01;
df1=@(x) diff(f1(x));
%%function[zero,res,wres,iterates,flag]=Bisezione(f,a,b,toll,method)
%%function [zero,res,iterates,flag]=Newton(f,df,x0,toll,itmax,method)
[zero_n,res_n,iterates_n]=Newton(f1(x),df1(x),2,10^(-12),100,'m');
[zero_b,res_b,iterates_b]=Bisezione(f1(x),1,2,10^(-12),'r');

%%Approssimazione della soluzione sqrt(2)
%%con f_m(x)=0 nei casi m=1,3,5 chiamando il metodo di Newton
%%con il criterio dello scarto

%%function [zero,res,iterates,flag]=Newton(f,df,x0,toll,itmax,method)
[zero1,res1,iterates1]=Newton(f1(x),df1(x),2,10^(-8),100,'m');

[zero2,res2,iterates2]=Newton(f3(x),df3(x),2,10^(-8),100,'m');

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


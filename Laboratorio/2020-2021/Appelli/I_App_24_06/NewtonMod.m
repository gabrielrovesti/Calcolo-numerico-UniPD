function [zero,res,iterates,flag]=NewtonMod(f,df,x0,m,toll,itmax,method)
%% METODO DI NEWTON MODIFICATO CON SCELTA DEL CRITERIO DI ARRESTO
%
%                                               Versione 04-26-2021
%                                               Federico Piazzon
%
% ----------INPUT----------------------------------------------------------
% f             function handle di una funzione continua da [a,b] in R
% df
% x0            double [1 x 1] punto di partenza
% m             double [1 x 1] ordine della radice cercata
% toll          double [1 x 1] tolleranza per criterio di arresto
% itmax         double [1 X 1] massimo numero di iterazioni
% method        char [1 x 1] test di arresto:
%                       method = 's' test dello scarto
%                       method = 'r' test del residuo 
%                       method = 'm' minimo delle due stime < toll
%
% ----------OUTPUT---------------------------------------------------------
% zero          double [1 x 1] ultima approssimazione della radice
% res           double [1 x 1] modulo del residuo
% iterates      double [1 x N] iterate del metodo di bisezione:
% flag          char [1 x 1] stato:
%                       flag = 's' uscita per test dello scarto
%                       flag = 'r' uscita per test dell residuo 
%                       flag = 'a' uscita per entrambi i test
%                       flag = 'e' raggiunto il massimo numero di
%                                  iterazioni
%                       flag = 'f' residuo 0 in numero finito di iterazioni
%-----------FUNCTION BODY--------------------------------------------------
if m<0
    error('the order of the zero needs to be a positive integer\n')
elseif abs(m-round(m))>0
    warning('the order of the zero needs to be a positive integer\n')
    m=round(m);
    fprintf('rounding the order to %d\n',m);
end
iterates=zeros(1,itmax);
iterates(:,1)=x0;
res=f(x0);
n=1;z=1;
switch method
    case 's' % test di arresto dello scarto (per Newton è un residuo pesato appross)
        s=toll+1;
        while s>toll && n<itmax
            step=m*res/df(iterates(1,n));
            iterates(1,n+1)=iterates(1,n)-step;
            res=f(iterates(1,n+1));
            s=abs(step);
            n=n+1;
            if res==0
                z=0;
                break
            end
        end
        if z==1 
            if n<itmax
                flag='s';
            else
                flag='e';
            end
        else
            flag='f';
        end
        zero=iterates(1,n);
        iterates=iterates(:,1:n);
    case 'r' % test di arresto del residuo 
        while abs(res)>toll && n<itmax
            step=m*res/df(iterates(1,n));
            iterates(1,n+1)=iterates(1,n)-step;
            res=f(iterates(1,n+1));
            s=abs(step);
            n=n+1;
            if res==0
                z=0;
                break
            end
        end
        if z==1 
            if n<itmax
                flag='r';
            else
                flag='e';
            end
        else
            flag='f';
        end
        zero=iterates(1,n);
        iterates=iterates(:,1:n);
    case 'm' % minimo dei due test
        s=toll+1;
        while min(abs(res),s)>toll && n<itmax
            step=m*res/df(iterates(1,n));
            iterates(1,n+1)=iterates(1,n)-step;
            res=f(iterates(1,n+1));
            s=abs(step);
            n=n+1;
            if res==0
                z=0;
                break
            end
        end
        if z==0 
            flag='f';
        else
            if s<toll
                if abs(res)<toll
                    flag='a';
                else
                    flag='s';
                end
            else
                if abs(res)>toll
                    flag='e';
                else
                    flag='r';
                end
            end
        end
        zero=iterates(1,n);
        iterates=iterates(:,1:n);
end


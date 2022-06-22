function [zero,res_vec,iterates,flag]=Secanti(f,x0,x1,toll,itmax,method)
%% METODO DELLE SECANTI CON SCELTA DEL CRITERIO DI ARRESTO
%
%                                               Versione 04-26-2021
%                                               Federico Piazzon
%
% ----------INPUT----------------------------------------------------------
% f             function handle di una funzione continua da [a,b] in R
% x0            double [1 x 1] punto di partenza
% x1            double [1 x 1] prima iterata
% toll          double [1 x 1] tolleranza per criterio di arresto
% itmax         double [1 X 1] massimo numero di iterazioni
% method        char [1 x 1] test di arresto:
%                       method = 's' test dello scarto
%                       method = 'r' test del residuo
%                       method = 'm' minimo delle due stime < toll
%
% ----------OUTPUT---------------------------------------------------------
% zero          double [1 x 1] ultima approssimazione della radice
% res_vec       double [1 x N] vettore dei residui
% iterates      double [1 x N] iterate del metodo di bisezione:
% flag          char [1 x 1] stato:
%                       flag = 's' uscita per test dello scarto
%                       flag = 'r' uscita per test dell residuo
%                       flag = 'a' uscita per entrambi i test
%                       flag = 'e' raggiunto il massimo numero di
%                                  iterazioni
%                       flag = 'f' residuo 0 in numero finito di iterazioni
%-----------FUNCTION BODY--------------------------------------------------

iterates=zeros(1,itmax);
iterates(1:2)=[x0,x1];
res_vec=zeros(1,itmax);
res_vec(1:2)=[f(x0),f(x1)];
n=1;z=1;
switch method
    case 's' % test di arresto dello scarto (per Newton è un residuo pesato appross)
        step=x1-x0;
        s=toll+1;
        while s>toll && n<itmax
            step=-res_vec(n+1)*step/(res_vec(n+1)-res_vec(n));
            iterates(n+2)=iterates(n+1)+step;
            res_vec(n+2)=f(iterates(1,n+2));
            s=abs(step);
            n=n+1;
            if res_vec(n+1)==0
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
        zero=iterates(1,n+1);
        iterates=iterates(1:n+1);
        res_vec=res_vec(1:n+1);
    case 'r' % test di arresto del residuo
        step=x1-x0;
        while abs(res)>toll && n<itmax
            step=-res_vec(n+1)*step/(res_vec(n+1)-res_vec(n));
            iterates(n+2)=iterates(n+1)+step;
            res_vec(n+2)=f(iterates(1,n+2));
            n=n+1;
            if res_vec(n+1)==0
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
        res_vec=res_vec(1:n+1);
    case 'm' % minimo dei due test
        step=x1-x0;
        s=toll+1;
        while min(abs(res_vec(n+1)),s)>toll && n<itmax
            step=-res_vec(n+1)*step/(res_vec(n+1)-res_vec(n));
            iterates(n+2)=iterates(n+1)+step;
            res_vec(n+2)=f(iterates(1,n+2));
            s=abs(step);
            n=n+1;
            if res_vec(n+1)==0
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
        res_vec=res_vec(1:n+1);
end
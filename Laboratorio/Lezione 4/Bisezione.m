function[zero,res,wres,iterates,flag]=Bisezione(f,a,b,toll,method)
%% METODO DI BISEZIONE
%
% ----------INPUT----------------------------------------------------------
% f             function handle di una funzione continua da [a,b] in R
% a             double [1 x 1] estr inf intervallo
% b             double [1 x 1] sup intervallo
% toll          double [1 x 1] tolleranza per criterio di arresto
% method        char [1 x 1] test di arresto:
%                       method = 's' test dello scarto
%                       method = 'r' test del residuo pesato approssimato
%                       method = 'm' minimo delle due stime < toll
%
% ----------OUTPUT---------------------------------------------------------
% zero          double [1 x 1] ultima approssimazione della radice
% res           double [1 x 1] modulo del residuo
% wres          double [1 x 1] modulo del residuo pesato approssimato
% iterates      double [3 x N] iterate del metodo di bisezione:
%                       iterates(1,:)= x_0,x_1,...
%                       iterates(2,:)= a_0,a_1,...
%                       iterates(3,:)= b_0,b_1,...
% flag          char [1 x 1] stato:
%                       flag = 's' uscita per test dello scarto
%                       flag = 'r' uscita per test dell residuo pesato approssimato
%                       flag = 'b' uscita causata da entrambi i test
%                       flag = 'f' residuo 0 in numero finito di iterazioni
%--------------------------------------------------------------------------

itmax=ceil(log2(b-a)-log2(toll));
iterates=zeros(3,itmax);
iterates(:,1)=[(a+b)/2;a;b];
n=0;z=1;
switch method
    case 's' % test di arresto dello scarto
        s=b-a;
        while s>toll
            if f(iterates(2,n+1))*f(iterates(1,n+1))<0
                iterates(2,n+2)=iterates(2,n+1);
                iterates(3,n+2)=iterates(1,n+1);
                iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
            elseif f(iterates(2,n+1))*f(iterates(1,n+1))>0
                iterates(2,n+2)=iterates(1,n+1);
                iterates(3,n+2)=iterates(3,n+1);
                iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
            else
                z=0;
                break
            end
            s=iterates(3,n+2)-iterates(2,n+2);
            n=n+1;
        end
        if z==1
            flag='s';
        else
            flag='f';
        end
        zero=iterates(1,n+1);res=f(zero);
        if n>1
            wres=abs(res)*abs(iterates(1,n+1)-iterates(1,n))/abs(f(iterates(1,n+1))-f(iterates(1,n)));
        else
            wres=NaN;
        end
        iterates=iterates(:,1:n+1);
    case 'r' % test di arresto del residuo pesato
        % prima iterazione per calcolare il residuo pesato approx
        if f(iterates(2,n+1))*f(iterates(1,n+1))<0
            iterates(2,n+2)=iterates(2,n+1);
            iterates(3,n+2)=iterates(1,n+1);
            iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
        elseif f(iterates(2,n+1))*f(iterates(1,n+1))<0
            iterates(2,n+2)=iterates(1,n+1);
            iterates(3,n+2)=iterates(3,n+1);
            iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
        else
            zero= iterates(1,n+2);
            res=f(zero);
            wres=NaN;
            flag='f';
            return            
        end
        n=n+1;
        res=f(iterates(1,n+1));
        wres=abs(res)*abs(iterates(1,n+1)-iterates(1,n))/abs(f(iterates(1,n+1))-f(iterates(1,n)));
        while wres>toll
            if f(iterates(2,n+1))*f(iterates(1,n+1))<0
                iterates(2,n+2)=iterates(2,n+1);
                iterates(3,n+2)=iterates(1,n+1);
                iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
            elseif f(iterates(2,n+1))*f(iterates(1,n+1))>0
                iterates(2,n+2)=iterates(1,n+1);
                iterates(3,n+2)=iterates(3,n+1);
                iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
            else
                zero= iterates(1,n+2);
                res=f(zero);
                wres=0;
                flag='f';
                return
            end
            n=n+1;
            res=f(iterates(1,n+1));
            wres=abs(res)*abs(iterates(1,n+1)-iterates(1,n))/abs(f(iterates(1,n+1))-f(iterates(1,n)));
        end
        flag='r';zero=iterates(1,n+1);res=f(zero);
        iterates=iterates(:,1:n+1);
    case 'm'
        s=b-a;
        % prima iterazione per calcolare il residuo pesato approx
        if f(iterates(2,n+1))*f(iterates(1,n+1))<0
            iterates(2,n+2)=iterates(2,n+1);
            iterates(3,n+2)=iterates(1,n+1);
            iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
        elseif f(iterates(2,n+1))*f(iterates(1,n+1))>0
            iterates(2,n+2)=iterates(1,n+1);
            iterates(3,n+2)=iterates(3,n+1);
            iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
        else
            zero= iterates(1,n+2);
            res=f(zero);
            wres=NaN;
            flag='f';
            return            
        end
        n=n+1;
        s=iterates(3,n+1)-iterates(2,n+1);
        res=f(iterates(1,n+1));
        wres=abs(res)*abs(iterates(1,n+1)-iterates(1,n))/abs(f(iterates(1,n+1))-f(iterates(1,n)));
        while min(wres,s)>toll 
            if f(iterates(2,n+1))*f(iterates(1,n+1))<0
                iterates(2,n+2)=iterates(2,n+1);
                iterates(3,n+2)=iterates(1,n+1);
                iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
            elseif f(iterates(2,n+1))*f(iterates(1,n+1))>0
                iterates(2,n+2)=iterates(1,n+1);
                iterates(3,n+2)=iterates(3,n+1);
                iterates(1,n+2)=(iterates(2,n+2)+iterates(3,n+2))/2;
            else
                zero= iterates(1,n+2);
                res=f(zero);
                wres=0;
                flag='f';
                return
            end
            n=n+1;
            wres=abs(res)*abs(iterates(1,n+1)-iterates(1,n))/abs(f(iterates(1,n+1))-f(iterates(1,n)));
            s=iterates(3,n+1)-iterates(2,n+1);
        end
        zero=iterates(1,n+1);res=f(zero);
        if wres<toll
            if s> toll
                flag='r';
            else
                flag='b';
            end
        else
            flag='s';
        end
        iterates=iterates(:,1:n+1);
        res=abs(res);
end

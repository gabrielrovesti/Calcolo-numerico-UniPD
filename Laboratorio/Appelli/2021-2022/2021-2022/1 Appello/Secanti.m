function [zero, x]=Secanti(f, x0, x1, toll, maxit)
% ----------INPUT----------------------------------------------------------
% f             function handle
% x0            double [1 x 1] punto di partenza
% x1            double [1 x 1] prima iterata
% toll          double [1 x 1] tolleranza per criterio di arresto
% maxit         double [1 X 1] massimo numero di iterazioni
% ----------OUTPUT---------------------------------------------------------
% zero          double [1 x 1] ultima approssimazione della radice
% x             double [1 x N] iterate del metodo delle secanti:
%-----------FUNCTION BODY--------------------------------------------------

it=0;
x=zeros(1,maxit);
x(1:2)=[x0,x1];
step=toll+1;
while it < maxit && step > toll
    it=it+1;
    x=[x, f(x(1:it+1))];
end
zero=x(1,it+1); 
end

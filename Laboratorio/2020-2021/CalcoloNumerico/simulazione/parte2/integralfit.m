function I = integralfit(a, b, x, f, n)
% Help: integralfit
% Calcolo polinomio approssimazione ai minimi quadrati
% di f sui nodi x
% ----------INPUT----------------------------------------------------------
% a             double [1 x 1] estremo inferiore di integrazione
% b             double [1 x 1] estremo superiore di integrazione
% x             double [m x n+1] vettore colonna su tutti i punti in [a,b]
% f             function handle
% n             double    
% ----------OUTPUT---------------------------------------------------------
% p             Polinomio al più n di approssimazione ai minimi quadrati
%-----------FUNCTION BODY--------------------------------------------------

peval=zeros(length(n));
I=peval; x_a=peval;
for k=n
    x_a= 1/(k+1).*(b^(k+1) - a^(k+1));
    y_a=f(x_a);
    c = polyfit(x_a, y_a, n);
    I(k) = polyval(c, x_a);
end

end
function phi = MappaNewtonMod(f,f1,x,m)
    phi = x - m.*f(x)./f1(x);

    % D(f(x)/g(x)) = 
   %    ((f'(x)*g(x) - f(x)*g'(x)))/ g(x)^2
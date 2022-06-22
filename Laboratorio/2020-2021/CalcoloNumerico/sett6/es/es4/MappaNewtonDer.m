function phi = MappaNewtonDer(f,f1,f2,x)
    phi = f(x).*f2(x)./f1(x).^2;

    % D(f(x)/g(x)) = 
   %    ((f'(x)*g(x) - f(x)*g'(x)))/ g(x)^2
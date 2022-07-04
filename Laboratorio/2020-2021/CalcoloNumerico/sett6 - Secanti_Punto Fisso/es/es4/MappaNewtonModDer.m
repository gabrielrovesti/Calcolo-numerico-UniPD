function phi=MappaNewtonModDer(f,f1,f2,x,m)
    phi=1-m*(f1(x).^2 - f(x).*f2(x)./f1(x).^2);
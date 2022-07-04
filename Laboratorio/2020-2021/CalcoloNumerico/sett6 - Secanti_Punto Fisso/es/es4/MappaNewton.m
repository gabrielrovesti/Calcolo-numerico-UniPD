function phi = MappaNewton(f,f1,x)
    phi = x - f(x)./f1(x);
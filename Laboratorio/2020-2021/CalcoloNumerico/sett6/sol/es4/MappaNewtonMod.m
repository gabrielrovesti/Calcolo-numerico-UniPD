function phi=MappaNewtonMod(f,f1,x,m)
phi=x-m*f(x)./f1(x);
function phi=MappaNewtonDer(f,f1,f2,x)
phi = 1 - (f1(x).^2 - f(x).*f2(x)./f1(x).^2);

% o anche
% f(x).*f2(x)./f1(x).^2
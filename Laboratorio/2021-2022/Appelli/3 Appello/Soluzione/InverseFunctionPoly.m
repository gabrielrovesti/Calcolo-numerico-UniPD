function xeval=InverseFunctionPoly(f,xmin,xmax,toll,n,yeval)
ymin=f(xmin);
ymax=f(xmax);
yinterp=(ymax-ymin)/2*cos((0:n)'/n*pi)+(ymin+ymax)/2;
xinterp=zeros(n+1,1);
for i=1:n+1
    fi=@(x) f(x)-yinterp(i);
    xinterp(i)=Bisezione(fi,xmin,xmax,toll,'s');
end
L=LagrangePoly(yinterp,yeval);
xeval=L*xinterp;
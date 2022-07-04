function [peval,c]=MyPolyfit_unstable(xfit,xeval,yfit,deg)
V=xfit.^(0:deg);%chebvand1d(deg,xfit);
Veval=xeval.^(0:deg);%chebvand1d(deg,xeval);
G=V'*V;
z=V'*yfit;
c=G\z;
peval=Veval*c;
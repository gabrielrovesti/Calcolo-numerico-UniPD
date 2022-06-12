toll=10^-8;
x0=-0.2;
maxit=10;
tollm=10^-12;
maxitm=20;

xmin=-0.5;xmax=0.5;

f=@(x) ((gamma(x+1)-1).*x).^2;
f1=@(x) 2*((gamma(x+1)-1).*x).* ((2+ x.*mypsi(x)).*gamma(x+1)-1);

[zero,res,iterates,flag]=Newton(f,f1,x0,toll,maxit,'s');
s=iterates(2:end)-iterates(1:end-1);
C=abs(s(end)/s(end-1));
m=round(1/(1-C));
fprintf('Molteplicità stimata = %d\n',m)
x0m=zero;
[zerom,resm,iteratesm,flagm]=NewtonMod(f,f1,x0m,m,tollm,maxitm,'s');
l=length(iteratesm)

sm=iteratesm(2:end)-iteratesm(1:end-1);
Cmvet=abs(sm(2:end)./(sm(1:end-1).^2));
Cmvetopt=Cmvet(end-1:end);

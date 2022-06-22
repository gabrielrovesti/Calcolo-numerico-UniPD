p=0.7;
N=3;
a=0;b=2;toll=10^-8;itmax=100;
f=@(x) prob_cum(x,N)-p/2;
xapprox=bisezione(f,a,b,toll,itmax);
step=toll+1;
while N<10000 && step>toll
    N=2*N;
    f=@(x) prob_cum(x,N)-p/2;
    xnew=bisezione(f,a,b,toll,itmax);
    step=abs(xapprox(end)-xnew);
    xapprox=[xapprox,xnew];
end
xend=xapprox(end);
xref=erfinv(p);
err=abs(xend-xref);
fprintf('errore %1.3e\n',err)

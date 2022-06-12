function x=bisezione(f,a,b,toll,itmax)
c=(a+b)/2;
step=toll+1;
it=1;
while it<itmax && step>toll
    it=it+1;
    c=(b+a)/2;
    if f(a)*f(c)<0
        b=c;
    elseif f(c)==0
        break
    else
        a=c;
    end
end
x=c;

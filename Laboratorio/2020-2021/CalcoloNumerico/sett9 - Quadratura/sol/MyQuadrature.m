function [integrale,I,step,flag]=MyQuadrature(a,b,f,formula,toll,maxN)
N=1;flag=0;
[x,w]=formula(a,b,N);
I=w*f(x);
step=toll+1;
while step>toll && N<maxN/2
    N=2*N;
    [x,w]=formula(a,b,N);
    I=[I,w*f(x)];
    step=abs(I(end)-I(end-1));
end
integrale=I(end);
if abs(step)<toll
    flag=1;
end
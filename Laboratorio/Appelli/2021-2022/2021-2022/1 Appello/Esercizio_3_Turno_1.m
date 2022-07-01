clear
close all
clc
% formula di quadratura dei trapezi con N+1 punti
N=100;
a=1; b=-1;
It=zeros(1,length(N));
intvero=0.44;   %dopo il calcolo dell'integrale
h=(b-a)./(2*N);

for i=N
    x=linspace(-1,1,2*i+1)';
    f=@(x) exp^(-1)./(1-x^2);
    w=(b-a)/2*i*[1/2,ones(1,2*i-1),1/2];
    It(i)=w*(x);
end

fprintf("Approssimazione integrale: %1.12f \n", abs(intvero - It));
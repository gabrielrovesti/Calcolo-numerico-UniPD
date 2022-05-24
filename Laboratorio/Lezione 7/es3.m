% approximation of sin
%requires Trapezi.m, Parabole.m

clear all;
close all;

f=@(x) sin(x);
a=0;
b=pi/2;
intvero=1;
ks=1:15;
It=zeros(1,length(ks));
Ip=It;

%integrali su nodi di Chebyshev
%ed equispaziati
Icheb=It;
Iequi=It;

h=(b-a)./(2*ks);
for i=ks
    N=2*i;
    %nodi equispaziati
    xequi=linspace(a,b,N+1)';
    %nodi di Chebyshev
    xcheb=(a+b)/2+(b-a)/2*cos((2*(N-1:-1:0)+1)./(2*N+1)*pi)';
    
    [x,w]=Trapezi(a,b,2*i);
    [r,s]=Parabole(a,b,i);

    %qua userò la formula interpolatoria
    %per gli equispaziati e per Chebyshev
    [we, We, flage]=FormulaInterpolatoria(xequi, a, b, 10.^-5, 100);
    [wc, Wc, flagc]=FormulaInterpolatoria(xcheb, a, b, 10.^-5, 100);

    %%anche qui mi salvo la successione richiesta
    It(i)=w*f(x);
    Ip(i)=s*f(r);
    Iequi(i)=we*f(xequi);
    Icheb(i)=wc*f(xcheb);
end
figure(1);
semilogy(2*ks+1, abs(intvero-It),'b');
hold on
semilogy(2*ks+1, abs(intvero-Ip),'g');
semilogy(2*ks+1, abs(intvero-Iequi),'r');
semilogy(2*ks+1, abs(intvero-Icheb),'y');
legend("Errore assoluto", "Errore parabole", "Errore equispaziati", "Errore Chebyshev");
title(['Errori di quadratura di f su [0,pi/2]'])
xlabel('Numero punti di quadratura');
hold off
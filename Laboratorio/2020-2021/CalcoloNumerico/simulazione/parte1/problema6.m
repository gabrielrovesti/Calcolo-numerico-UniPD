% problema 6
cs=1:15;
n=11;

jdispari=1:2:n+1;
jpari=2:2:n+1;

xinterp=linspace(-1,1,101);
xeval=linspace(-1,1,1000);

for k=1:length(cs)
    c=cs(k);
    f=@(x) c./(c+x.^2);
    
    yinterp=f(xinterp);
    yeval=f(xeval);
    
    coef=polyfit(xinterp,yinterp,n);
    
    semilogy(abs(coef))
    pause(1)
    fprintf('massimo coefficiente di grado pari = %1.5e\n',max(abs(coef(jpari))))
    fprintf('massimo coefficiente di grado dispari = %1.5e\n',max(abs(coef(jdispari))))
end

% come si vede da grafici e stampa a video i coefficienti dei gradi dispari
% sono molto piccoli, la funzione è pari e i nodi di approssimazione
% simmetrici, il probema è simmetrico dunque la soluzione "esatta" avrebbe
% soli gradi pari, numericamente vengono calcolati polinomi con piccoli
% coef relativi ai gradi dispari.
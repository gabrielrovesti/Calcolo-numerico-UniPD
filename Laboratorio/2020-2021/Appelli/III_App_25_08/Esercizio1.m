clear all
close all
clc
warning off
% punto 1
nvalues=1:2:29;
m=18;
l=3;
res=[];
A=@(t) diag([t*ones(l,1);ones(m-l,1)])+diag(ones(m-1,1),-1)+diag(ones(m-1,1),1);
b=[1;2*ones(l-1,1);3*ones(m-l-1,1);2];
% punto 2
[L U P]=lu(A(0));
if min(abs(diag(U)))==0
fprintf('La matrice A(0) e'' singolare perche'' la matrice U ha elementi diagonali nulli\n')
end
% punto 3
teval=linspace(-1/2,1/2);
for n=nvalues
    clf
    figure(1);
    hold on
    tsample=0.5*cos((0:n)./n*pi);
    V=tsample'.^(0:n);  
    for i=1:n+1
        [L U P]=lu(A(tsample(i)));
        xsample(:,i)=U\(L\(P*b));
    end
    for k=1:m
        coeff=polyfit(tsample,xsample(k,:),n);
        xeval0(k,1)=polyval(coeff,0);
        for j=1:100
            xeval(k,j)=polyval(coeff,teval(j));
        end
    end
    plot(teval,xeval');
    title(['Interpolazione a grado ' num2str(n)])
    pause(1)
    hold off
    res=[res norm(A(0)*xeval0-b)];
end
%%
figure(2)
semilogy(nvalues,res)
title('residui vs grado')
%%
fprintf('il vettore b sta nell'' immagine della matrice A(0), \n dunque esiste almeno una soluzione del sistema lineare\n A(0)x=b\n.')
fprintf('Visto che la matrice A(0) e'' singolare, esistono in realtà infinite soluzioni\n')
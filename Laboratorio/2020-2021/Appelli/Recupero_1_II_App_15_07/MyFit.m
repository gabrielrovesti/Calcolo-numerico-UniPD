function [peval,coeff]=MyFit(xsample,ysample,deg,xeval,method)
% calcola valutazione del polinomio di miglior approssimazione ai minimi 
% quadrati e suoi coefficienti rispetto a base monomiale decrescente in 
% grado, eventualmente scalata se method=4.
% INPUT--------------------------------------------------------------------
% xsample       vettore colonna [Mx1] con i dati x
% ysample       vettore colonna [Mx1] con i dati y
% deg           scalare (intero positivo < M) grado massimo polinomio
% xeval         vettore colonna [Nx1] punti di valutazione
% method        = 1 soluzione eq. normali con LU
%               = 2 soluzione con QR
%               = 3 soluzione con backslash
%               = 4 polyfit/polyval (Attenzione, altra base polinomiale)
% OUTPUT-------------------------------------------------------------------
% peval         vettore colonna [Nx1] valutazione del pol su xeval
% coeff         coefficienti calcolati
%--------------------------------------------------------------------------
switch method
    case 1
        A=xsample(:).^(deg:-1:0);
        Aeval=xeval(:).^(deg:-1:0);
        G=A'*A;
        [L, U, P]=lu(G);
        coeff=U\(L\(P*(A'*ysample(:))));
        peval=Aeval*coeff;
    case 2
        A=xsample(:).^(deg:-1:0);
        Aeval=xeval(:).^(deg:-1:0);
        [Q0,R0]=qr(A,0);
        coeff=R0\(Q0'*ysample(:));
        peval=Aeval*coeff;
    case 3
        A=xsample(:).^(deg:-1:0);
        G=A'*A;
        Aeval=xeval(:).^(deg:-1:0);
        coeff=G\(A'*ysample(:));
        peval=Aeval*coeff;
    case 4
        coeff=polyfit(xsample,ysample,deg);
        peval=polyval(coeff,xeval);
end

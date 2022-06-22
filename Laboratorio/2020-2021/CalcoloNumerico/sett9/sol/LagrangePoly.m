function L=LagrangePoly(xinterp,xeval)
%--------------------------------------------------------------------------
%
%                                               Ver. 03-05-2021
% L=LagrangePoly(xinterp,xeval) valuta i polinomi di Lagrange
%
% INPUT--------------------------------------------------------------------
% xinterp           double [1 x n+1] or [n+1 x 1] nodi di interpolazione
% xeval             double [1 x m] or [m x1] nodi di valutazione
%
% OUTPUT-------------------------------------------------------------------
% L                 double [m x n+1] L{i,j} è il j-esimo pol di Lagrange va
%                   lutato sul xeval{i}
%--------------------------------------------------------------------------
xinterp=xinterp(:);xeval=xeval(:);
n=length(xinterp)-1;m=length(xeval);
L=zeros(m,n);
Xei=-(xeval-xinterp');
Xii=xinterp-xinterp';Xii=Xii-diag(diag(Xii))+eye(length(xinterp));
for i=1:n+1
    L(:,i)=prod(Xei(:,[1:i-1,i+1:n+1]),2);
end
L=L./prod(Xii);
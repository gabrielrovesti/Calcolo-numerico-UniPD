function x=SostituzioneIndietro(U,b)
% solves upper triangular square linear system by backward substitution
% INPUT--------------------------------------------------------------------
% U    double [m X m] upper triangular matrix
% b    double [m X 1] right hand side of the system
% OUTPUT ------------------------------------------------------------------
% x    double [m X 1] solution of the system Ux=b.
% -------------------------------------------------------------------------
M=max(max(tril(U-diag(diag(U)))));
if M>1e-14
    warning(['U should be upper triangular!'...
    '\n maximum lower triangualr term is %g\n'], M);
end
if min(abs(diag(U)))==0
    error('matrice singolare')
end
n=size(U,1);
x=zeros(n,1);
x(n)=b(end)/U(n,n);
for k=1:n-1
    x(n-k)=(b(n-k)-U(n-k,:)*x)./U(n-k,n-k);
end
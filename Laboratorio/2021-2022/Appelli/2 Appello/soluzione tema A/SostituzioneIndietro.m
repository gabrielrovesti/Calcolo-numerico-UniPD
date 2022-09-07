function x=SostituzioneIndietro(U,b)
toll=10^-9;
% if norm(U-triu(U))>toll
%     error('La matrice deve essere triangolare superiore')
% end
if min(abs(diag(U)))==0
    error('matrice singolare')
end
n=size(U,1);
x=zeros(n,1);
x(n)=b(end)/U(n,n);
for k=1:n-1
    x(n-k)=(b(n-k)-U(n-k,:)*x)./U(n-k,n-k);
end
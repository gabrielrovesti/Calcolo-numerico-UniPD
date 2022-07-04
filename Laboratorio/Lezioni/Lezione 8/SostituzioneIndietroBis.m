function x=SostituzioneIndietroBis(U,B)
% if norm(U-triu(U))>toll
%     error('La matrice deve essere triangolare superiore')
% end
if min(abs(diag(U)))==0
    error('matrice singolare')
end
n=size(U,1);
x=zeros(size(B));
x(n,:)=B(end,:)/U(n,n);
for k=1:n-1
    x(n-k,:)=(B(n-k,:)-U(n-k,:)*x)./U(n-k,n-k);
end
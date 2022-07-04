function x=SostituzioneAvantiBis(L,B)
toll=10^-12;
if norm(L-tril(L))>toll
    error('La matrice deve essere triangolare inferiore')
end
if min(abs(diag(L)))==0
    error('matrice singolare')
end
n=size(L,1);
x=zeros(size(B));
x(1,:)=B(1,:)/L(1,1);
for k=1:n-1
    x(k+1,:)=(B(k+1,:)-L(k+1,:)*x)./L(k+1,k+1);
end
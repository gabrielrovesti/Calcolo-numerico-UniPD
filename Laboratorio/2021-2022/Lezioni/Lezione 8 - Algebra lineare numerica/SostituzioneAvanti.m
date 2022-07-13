function x=SostituzioneAvanti(L,b)
% Help: SostituzioneAvanti
% Risolve sistema lineare triangolare inferiore
% con la tecnica della sostituzione in avanti
% INPUT--------------------------------------------------------------------
% L    double [m X m] Matrice triangolare inferiore
% b    double [m X 1] Lato destro del sistema
% OUTPUT ------------------------------------------------------------------
% x    double [m X 1] Soluzione del sistema Lx=Pb.
% -------------------------------------------------------------------------

toll=10^-12;
if norm(L-tril(L))>toll
    error('La matrice deve essere triangolare inferiore')
end
if min(abs(diag(L)))==0
    error('Matrice singolare')
end
n=size(L,1);
x=zeros(n,1);
x(1)=b(1)/L(1,1);
for k=1:n-1
    x(k+1)=(b(k+1)-L(k+1,:)*x)./L(k+1,k+1);
end
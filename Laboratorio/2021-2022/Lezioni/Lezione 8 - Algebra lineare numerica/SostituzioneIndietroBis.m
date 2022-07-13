function x=SostituzioneIndietroBis(U,B)
% Help: SostituzioneIndietroBis
% Risolve sistema lineare triangolare superiore
% con la tecnica della sostituzione all'indietro
% in modo ottimizzato con l'algebra vettoriale
% per tutte le j colonne.
% INPUT--------------------------------------------------------------------
% U    double [m X m] Matrice triangolare superiore
% B    double [m X m] Matrice del lato destro del sistema
% OUTPUT ------------------------------------------------------------------
% x    double [m X 1] Soluzione del sistema Ux_j=B_j.
% -------------------------------------------------------------------------

if min(abs(diag(U)))==0
    error('matrice singolare')
end
n=size(U,1);
x=zeros(size(B));
x(n,:)=B(end,:)/U(n,n);
for k=1:n-1
    x(n-k,:)=(B(n-k,:)-U(n-k,:)*x)./U(n-k,n-k);
end
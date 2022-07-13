function x=SostituzioneAvantiBis(L,B)
% Help: SostituzioneAvantiBis
% Risolve sistema lineare triangolare inferiore
% con la tecnica della sostituzione in avanti
% in modo ottimizzato con l'algebra vettoriale
% per tutte le j colonne.
% INPUT--------------------------------------------------------------------
% L    double [m X m] Matrice triangolare inferiore
% B    double [m X m] Matrice del lato destro del sistema
% OUTPUT ------------------------------------------------------------------
% x    double [m X 1] Soluzione del sistema Lx_j=PB_j.
% -------------------------------------------------------------------------

toll=10^-12;
if norm(L-tril(L))>toll
    error('La matrice deve essere triangolare inferiore')
end
if min(abs(diag(L)))==0
    error('Matrice singolare')
end
n=size(L,1);
x=zeros(size(B));
%L'idea è che si ottimizzi eseguendo un ciclo
%e lo vada a calcolare su tutti i valori
%e non solo sul primo
x(1,:)=B(1,:)/L(1,1);
for k=1:n-1
    x(k+1,:)=(B(k+1,:)-L(k+1,:)*x)./L(k+1,k+1);
end
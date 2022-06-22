function A1 = myInv(A)

A1 = zeros(size(A));
[L,U,P] = lu(A);
I = eye(size(A));

for n = 1:size(A,1) 
    y = SostituzioneAvanti(L,P*I(:,n));
    A1(:,n) = SostituzioneIndietro(U,y);
end
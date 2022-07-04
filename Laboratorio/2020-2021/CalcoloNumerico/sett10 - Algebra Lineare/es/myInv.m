function A1 = myInv(A)

A1 = zeros(size(A));
[L,U,P] = lu(A);
I = eye(size(A));

for k = 1:size(A,1)
    y = SostituzioneAvanti(L,P*I(:,k));
    A1(:,k) = SostituzioneIndietro(U,y);
end

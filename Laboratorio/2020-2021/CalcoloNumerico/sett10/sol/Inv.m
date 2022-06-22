function A1 = Inv(A)

A1 = zeros(size(A));

[L,U,P] = lu(A);

y = SostituzioneAvantiBis(L,P*eye(size(A)));
A1 = SostituzioneIndietroBis(U,y);
function A1 = Inv(A)
%A1 = zeros(size(A));
[L,U,P] = lu(A);
B=eye(size(A));
y = SostituzioneAvantiBis(L,P*B);
A1 = SostituzioneIndietroBis(U,y);
end
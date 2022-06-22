function A1 = Inv(A)
    A1 =  zeros(size(A));

    [L,U,P] = lu(A);
    I = eye(size(A));
    
    y = SostituzioneAvantiBis(L,P*I);
    A1 = SostituzioneIndietroBis(U,y);
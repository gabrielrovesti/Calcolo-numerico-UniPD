function A1=myInv(A)
    [L, U, P]=lu(A);
    A1=U\(L\P);
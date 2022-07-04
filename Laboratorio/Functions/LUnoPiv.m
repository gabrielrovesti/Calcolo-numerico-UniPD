function [L, U] = LUnoPiv(A)
n = size(A,1);
L = eye(n);
for k = 1:n
    for i = k+1:n
        L(i,k) = A(i,k)/A(k,k);
        for j = k:n
            A(i,j) =  A(i,j) -L(i,k)*A(k,j);
        end
    end
end
U = A;
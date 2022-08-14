%% HELP:
%INPUT
%   x,y vettori colonna     [m x 1]
%   n                       [scalare]
%   xval vettore colonna    [k x 1]
% method:
%   full
%   rectangular
%
%OUTPUT
%   yval vettore colonna    [k x 1]
%%
function yval=myfit(x,y,xval,n,method)
A=x.^(0:n);
Aeval=xval.^(0:n); % matrice di vandermonde grande m x (n+1)
switch method
    case 'rectangular'
        [Q,R]=qr(A);
        R0=R(1:n+1,:);
        Q0=Q(:,1:n+1);
        c=SostituzioneIndietro(R0,Q0'*y(:));
        yval=Aeval*c;
    case 'full'
        G=A'*A;
        [Q0,R0]=qr(G,0);
        c=SostituzioneIndietro(R0,Q0'*A'*y(:));
        yval=Aeval*c;
end

% 21348 Greggio Marta
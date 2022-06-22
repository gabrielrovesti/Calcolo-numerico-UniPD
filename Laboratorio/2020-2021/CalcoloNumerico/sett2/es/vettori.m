N = 20;

% u = (1,3,5,...)
u = 1:2:N;

% v = (-1,3,-5,...)
v = (u .* (repmat(-1, 1, length(u)) .^ (1:length(u))))'
v = (u.*(-1).^(1:length(u)))'


% w = (-1, 3^2, -5^3, 7^4, ...) con al più sqrt(N) elementi
m = floor(sqrt(N));
% Due modi:
%   partire da v
w = v(1:m)'.^(1:m)
%   partire da u
w = (-u(1:m)).^(1:m)

% z = (1 3 2 4 3 5 4 6 5 7...)
Z = [1:N-2;3:N];
z = Z(:)

% c = "coefficienti dello sviluppo di Taylor di e^x"
% Remainder: i coefficienti per e^x sono 1/n!
% funzione factorial
c = 1 ./ factorial(0:N-1);

% d = "coefficienti dello sviluppo di Taylor di log(x+1)"
% Remainder: i coefficienti per log(x+1) sono ((-1)^(n-1))/n
d = [0,((-1).^(0:N-2))./(1:N-1)]
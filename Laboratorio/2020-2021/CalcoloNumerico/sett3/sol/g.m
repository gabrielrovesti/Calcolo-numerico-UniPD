function y = g(x)
%g.m Compute the function e^x/(x^2 + 1)
% Input:
%   x:  vector of x-coordinates
%
% Output:
%   y: the relative y-coordinates of the given x

y = exp(x)./(x.^2 + 1);
end


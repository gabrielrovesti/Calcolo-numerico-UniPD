function [x,w]=Parabole(a,b,N)
% formula di quadratura delle parabole con 2N+1 punti
x=linspace(a,b,2*N+1)';
w=(b-a)/(6*N).*[1,repmat([4 2],1,N-1),4,1];
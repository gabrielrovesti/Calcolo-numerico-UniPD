function V=chebvand1d(deg,nodes)
% computes Vandermonde matrix of degree "deg" on "nodes" in the Chebyshev
% basis
%--------------------------------------------------------------------------
% INPUT -------------------------------------------------------------------
% deg     maximum considered polynomial degree
% nodes   double [m X 1] nodes of interpolation or evaluation
%--------------------------------------------------------------------------
% OUTPUT-------------------------------------------------------------------
% V       V(i,j)=T_{j-1}(nodes{i}) the Vandermonde basis at given nodes
%--------------------------------------------------------------------------
% FUNCTION BODY:
nodes=nodes(:);
V=cos(acos(nodes)*(deg:-1:0));
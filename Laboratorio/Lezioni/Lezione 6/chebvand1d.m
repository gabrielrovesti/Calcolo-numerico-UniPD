function V = chebvand1d(deg,nodes)
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

% FUNCTION BODY
nodes=nodes(:);
%prende il vettore nodes in maniera da prendere
%tutti gli indici dell'array in successione
%in tale modo ottengo sempre la colonna
%%serve a listare in una sola colonna tutti i valori di nodes
V=cos(acos(nodes).*(deg:-1:0));
%si mette un matrice che al posto di [i,j]
%uguale se si mette nell'ultimo pezzo
%(0:1:deg) equivale a (deg:-1:0)
end

%%
%%function V=chebvand1d(deg,nodes)
% computes Vandermonde matrix of degree "deg" on "nodes" 
%%if size(nodes,1)<size(nodes,2)
%%    nodes=nodes';
%%end
%%V=cos(acos(nodes)*(deg:-1:0));
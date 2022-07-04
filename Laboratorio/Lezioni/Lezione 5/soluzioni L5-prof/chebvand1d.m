function V=chebvand1d(deg,nodes)
% computes Vandermonde matrix of degree "deg" on "nodes" 
if size(nodes,1)<size(nodes,2)
    nodes=nodes';
end
V=cos(acos(nodes)*(deg:-1:0));
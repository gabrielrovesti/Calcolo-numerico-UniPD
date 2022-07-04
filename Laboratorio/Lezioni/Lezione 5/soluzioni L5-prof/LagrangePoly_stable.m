function [L,CB,err]=LagrangePoly_stable(nodes,eval_nodes)
%--------------------------------------------------------------------------
%   Computes 1-d  Lagrange polynomials
%--------------------------------------------------------------------------
% INPUT
% nodes         (deg+1 X 1 reals array) interpolation nodes
% eval_nodes    (M X 1 reals array) evaluation nodes
% -------------------------------------------------------------------------
% OUTPUT
% L             (M X deg+1 reals array) Lagr. poly. evaluated at eval_nodes
% CB            (deg+1 X deg +1 real matrix) Change of basis (right multiply)

deg=size(nodes,1)-1;
V=chebvand1d(deg,nodes);
V_eval=chebvand1d(deg,eval_nodes);
[Q, R]=qr(V');
V1=R';
V1_eval=V_eval*Q;
[Q1, R1]=qr(V1');
V2=R1';
cond(V2)
V2_eval=V1_eval*Q1;
CB=V2\eye(deg+1);
err=norm(V2*CB-eye(deg+1));
L=V2_eval*CB;
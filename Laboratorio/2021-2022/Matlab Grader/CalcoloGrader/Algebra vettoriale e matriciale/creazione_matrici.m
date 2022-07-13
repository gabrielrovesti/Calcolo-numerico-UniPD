N=10;
u=1:2:N;
v=2:2:N-1
A=diag(u)+diag(v,1)+diag(v,-1)
u=1:N;
B=u'*u
C=(-1).^(u'+u)
D=[u'+u,u-u';u'-u,u'+u]

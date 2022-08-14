function [cN,bN,R0]=MyPolyfit(f,a,b,n,N)
[x,w]=Trapezi(a,b,N-1);
y=f(x);
V=x.^(0:n);
bN=V'*diag(w)*y;
S=diag(w.^(1/2))*V;
[Q R]=qr(S);
R0=R(1:n+1,:);
cN=SostituzioneIndietro(R0,SostituzioneAvanti(R0',bN));
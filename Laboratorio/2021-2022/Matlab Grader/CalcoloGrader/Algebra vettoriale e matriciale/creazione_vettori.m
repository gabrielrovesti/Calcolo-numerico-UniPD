N=20;m=floor(sqrt(N));
u=1:2:N
v=(u.*(-1).^(1:length(u)))'
w=(-u(1:m)).^(1:m)
Z=[1:N-2;3:N];
z=Z(:)
c=1./factorial(0:N-1)
d=[0,((-1).^(0:N-2))./(1:N-1)]

f = @(x) (x.^2-1).*(log(1+x)-x);
n = 8;

xinterp=0.5*cos((0:n)./n*pi);
yinterp=f(xinterp);

c = polyfit(xinterp, yinterp, n);
d = c(1:n).*(n:-1:1);

p = @(x) polyval(c, x);
dp = @(x) polyval(d, x);

% Dalle figure 2 e 3 posso notare come ci sia convergenza 

%df = @(x) 2*x .*(log(1+x)-x) + (x.^2-1).* (1./(1+x) -1);
%figure(2);
%plot(xinterp, f(xinterp), 'r');hold on;
%plot(xinterp, df(xinterp), 'b');
%plot(xinterp, p(xinterp), 'y--');
%plot(xinterp, dp(xinterp), 'g--');
%title('f, df, p e dp a confronto');
%legend('f','df','p','dp');
%hold off;

%df = @(x) 2*x .*(log(1+x)-x) + (x.^2-1).* (1./(1+x) -1);
%figure(3);
%semilogy(xinterp, abs(f(xinterp) - p(xinterp)), 'r');hold on;
%semilogy(xinterp, abs(df(xinterp) - dp(xinterp)), 'b');
%title('Errori con p e dp');
%legend('err su f','err su df');
%hold off;

vero_zero = 0;

[zero,res,iterates,flag] = Newton(p, dp, -0.6, 10^-12, 100, 's');

scarti = abs(diff(iterates));

figure(1);
semilogy(scarti);
title('Scarti con Newton');
legend('Scarti');
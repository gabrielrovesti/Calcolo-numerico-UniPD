% PROBLEMA 3
g=@(x) exp(-x);

% x*exp(x)-1 = 0 --> x*exp(x) = 1 --> exp(x) = 1/x --> 1/exp(x) =x -->
% --> exp(-x) = x

% -1 < g'(a) < 1 --> converge dove a appartiene all'intorno della soluzione 

absdg=@(x) abs(-exp(-x)); 
xplot=linspace(-1,1);
yplot=absdg(xplot);

figure(1);
plot(xplot,yplot);
hold on
plot(xplot,-1+0.*xplot);
plot(xplot,1+0.*xplot);
title('grafico della derivata di g')
legend('|dg|','-1','1')
hold off;

% ogni intervallo [a,b] con a>0 (strettamente!) va bene
a=0.1;
b=1;
fprintf('scelto l''intervallo [%1.5f,%1.5f]\n',a,b)

x0=0.8;
toll=10^-8;
itmax=40;
[pfisso,iterates,flag]=puntofisso(g,x0,toll,itmax);
if flag=='s'
    fprintf('zero calcolato %1.12f\n',zero)
    fprintf('partendo da x0=%1.12f\n',x0)
    fprintf('in %d iterazioni\n',length(iterates))
    fprintf('tolleranza raggiunta\n')
else
    fprintf('raggiunto il numero massimo di iterazioni')
end

% si noti che dg non può essere nulla nella radice!
p=1;
s=diff(iterates);
figure(2);
plot(abs(s(2:end)./s(1:end-1).^p))
title('appross. cost. asintotoca per conv. lineare')

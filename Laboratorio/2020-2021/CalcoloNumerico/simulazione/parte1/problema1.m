% PROBLEMA 1
f=@(x) x.*exp(x)-1;
df=@(x) exp(x)+x.*exp(x); 
xplot=linspace(0,1);
yplot=f(xplot);

figure(1);
plot(xplot,yplot);
hold on
plot(xplot,0.*xplot);
title('grafico della funzione xe^x-1')
legend('xe^x-1','x=0')
hold off;

x0=0.8;
toll=10^-8;
itmax=20;
[zero,res,iterates,flag]=Newton(f,df,x0,toll,itmax,'s');
if flag=='s' || flag=='f'
    fprintf('zero calcolato %1.12f\n',zero)
    fprintf('partendo da x0=%1.12f\n',x0)
    fprintf('in %d iterazioni\n',length(iterates))
    if flag=='s'
        fprintf('tolleranza raggiunta\n')
    else
        fprintf('residuo nullo\n')
    end
else
    fprintf('raggiunto il numero massimo di iterazioni')
end

% si noti che df non può essere nulla nella radice!
p=2;
s=diff(iterates);
figure(2);
plot(abs(s(2:end)./s(1:end-1).^p))
title('appross. cost. asintotoca per conv. quadratica')

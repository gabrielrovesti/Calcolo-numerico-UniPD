clear;

x = linspace(0,1,100);
f = @(x) exp(x).*(x.^2 + 1);

PlotAsIWant(x,f,10,'Plot','bo-','PlotName','e')
hold on
PlotAsIWant(x,@g,10,'Plot','g.--','PlotName','e')
hold off
clear;

f = @(x) exp(x).*(x.^2 + 1);
v = linspace(0,1,100);

figure(10)
plot(v,f(v))
hold on
plot(v,g(v))
hold off

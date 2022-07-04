clear;

xs = linspace(0,1,100);
f = @(x) exp(x).*(x.^2 + 1);

figure(10);
plot(xs,f(xs));
hold on
plot(xs,g(xs));
hold off
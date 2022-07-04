f = @(x) x.^2;
g = @(x) x.^3;
h = @(x) x.^4;

x = linspace(0,10,100);

figure(1);
hold on
plot(x,f(x))
plot(x,g(x))
hold off

figure(2);
hold on
plot(x,g(x))
plot(x,h(x))
hold off

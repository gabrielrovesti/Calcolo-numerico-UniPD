clear
close all
f={...
    @(x) x.^2-2, ... m=1
    @(x) (x.^2-2).^3,... % m=3
    @(x) (x.^2-2).^5 ... % m=5
    };

df={@(x) 2.*x,...
	@(x) 3.*f{1}(x).^2.*2.*x,...
	@(x) 5.*f{1}(x).^4.*2.*x};

ddf={...
    @(x) 2+0.*x,...
	@(x) 6*f{1}(x).*(df{1}(x).^2)+3.*f{1}(x).^2.*2,...
    @(x) 20*f{1}(x).^3.*(df{1}(x).^2)+5.*f{1}(x).^4.*2};

phi={...
    @(x) MappaNewton(f{1},df{1},x),...
    @(x) MappaNewton(f{2},df{2},x),...
    @(x) MappaNewton(f{3},df{3},x)};

phiDer={...
    @(x) MappaNewtonDer(f{1},df{1},ddf{1},x),...
    @(x) MappaNewtonDer(f{2},df{2},ddf{2},x),...
    @(x) MappaNewtonDer(f{3},df{3},ddf{3},x)};

phiMod={@(x) MappaNewtonMod(f{2},df{2},x,3),...
        @(x) MappaNewtonMod(f{3},df{3},x,5)};
phiModDer={...
    @(x) MappaNewtonModDer(f{2},df{2},ddf{2},x,3),...
    @(x) MappaNewtonModDer(f{3},df{3},ddf{3},x,5)};


xstar=sqrt(2); % soluzione vera
toll=10^-8;
itmax=100;
x0=2;
method='s';
%% 
a=1; b=2; xplot=linspace(1,2);

% per ciascun m
for i = 1 : length(fs)
    figure(i)
    % plottare
    plot(xplot,xplot)
    hold on
    plot(xplot, phi{i}(xplot))
    plot(xplot, phiDer{i}(xplot))
    plot(xstar, phiDer{i}(xstar),'o')

    if i > 1
        plot(xplot, phiMod{i-1}(xplot))
        plot(xplot, phiModDer{i-1}(xplot))
        % (se m=3 o m=5) mappa di iterazione Newton modificato
        % (se m=3 o m=5) mappa di iterazione derivata Newton modificato
    end
    legend('y=x','derivata nel pto fisso','mappa iterazione','derivata mappa',...
    'mappa iterazione mod', 'der mappa mod')
    title("caso m="+(2*i-1))
end
close all
clear

fs={@(x) x.^2-2,...
    @(x) (x.^2-2).^3,...
    @(x) (x.^2-2).^5};

dfs={...
    @(x) 2.*x,...
    @(x)6.*x.*fs{1}(x).^2,...
    @(x)10.*fs{1}(x).^4.*x};

ddfs={...
    @(x) 2,... 
    @(x) 6.* fs{1}(x).^2 + 2.*fs{1}(x).*dfs{1}(x),...
    @(x) 10 .* (fs{1}(x).^4 + 4.*x.*fs{1}(x).^3.*dfs{1}(x))};

xstar=sqrt(2); 
toll=10^-7;
itmax=20;
x0=sqrt(2)-1+.001;
x1=sqrt(2)+1+.002;
method='s';

%%
for i = 1 : length(fs)
    [zero_s(i),res_s{i},iterates_s{i},flag_s(i)]=Secanti(fs{i},x0,x1,toll,itmax,method);
    s_s{i}=iterates_s{i}(2:end)-iterates_s{i}(1:end-1);
    err_s{i}=abs(xstar-iterates_s{i});
    fprintf('------------Metodo delle secanti-----------------------------\n')
    fprintf('Numero di iterazioni = %d\n',length(iterates_s{i}));
    fprintf('Ultimo scarto = %1.12g\n',abs(s_s{i}(end)));
    fprintf('Ultima approssimazione = %1.12f\n',zero_s(i));
    fprintf('Ultimo errore = %1.15g\n',abs(zero_s(i)-xstar));
    fprintf('Residuo = %1.12g\n',res_s{i}(end));
    fprintf('termine algoritmo per:\n')
    switch flag_s
        case 's'
            fprintf('tolleranza raggiunta\n');
        case 'e'
            fprintf('numero di iterazioni\n');
        case 'r' 
            fprintf('uscita per test del residuo\n'); 
        case 'a' 
            fprintf('uscita per entrambi i test\n');
        case 'f' 
            fprintf('residuo 0 in numero finito di iterazioni\n');
    end

    [zero{i},res{i},iterates{i},flag{i}]=Newton(fs{i},dfs{i},x0,toll,itmax,method);
    s{i}=iterates{i}(2:end)-iterates{i}(1:end-1);
    err{i}=abs(iterates{i}-xstar);
    fprintf('------------Metodo di Newton --------------------------------\n')
    fprintf('Numero di iterazioni = %d\n',length(iterates{i}));
    fprintf('Ultimo scarto = %1.12g\n',abs(s{i}(end)));
    fprintf('Ultima approssimazione = %1.12f\n',zero{i});
    fprintf('Ultimo errore = %1.15g\n',abs(zero{i}-xstar));
    fprintf('Residuo = %1.12g\n',res{i}(end));
    fprintf('termine algoritmo per:\n')
    switch flag{i}
        case 's'
            fprintf('tolleranza raggiunta\n');
        case 'e'
            fprintf('numero di iterazioni\n');
        case 'r' 
            fprintf('uscita per test del residuo\n'); 
        case 'a' 
            fprintf('uscita per entrambi i test\n');
        case 'f' 
            fprintf('residuo 0 in numero finito di iterazioni\n');
    end
end

%%

graphics = ["b","g","r"];

figure(1);
Legend = {};
for i = 1 : length(fs)
    semilogy(err_s{i}, graphics(i));
    hold on
    semilogy(err{i}, graphics(i)+"--");
    Legend(end+1:end+2) = {"Secanti f_"+(2*i-1), "Newton f_"+(2*i-1)};
end
title('confronto degli errori')
legend(Legend)

p_s=(1+sqrt(5))/2;
for i = 1 : length(fs)
    if abs(dfs{i}(xstar)) >= toll && abs(ddfs{i}(xstar)) >= toll
        C_s{i}=abs(s_s{i}(2:end))./abs(s_s{i}(1:end-1)).^p_s;
        C{i}=abs(s{i}(2:end))./(abs(s{i}(1:end-1)).^2);
    else
        C_s{i}=abs(s_s{i}(2:end))./abs(s_s{i}(1:end-1));
        C{i}=abs(s{i}(2:end))./(abs(s{i}(1:end-1)));
    end
end

for i = 1:length(fs)
    figure(1 + i)
    Legend = {};
    plot(C_s{i});
    hold on
    plot(C{i})
    m = 2*i-1;
    Legend(end+1 : end+2) = {...
        "$\frac{s_k}{s_{k-1}^{p_s}}$ per $f_"+m+"$",...
        "$\frac{s_k}{s_{k-1}^2}$ per $f_"+m+"$"...
        };

    if abs(dfs{i}(xstar)) >= toll && abs(ddfs{i}(xstar)) >= toll 
        plot(1:length(C_s{i}),0.*C_s{i}+(ddfs{i}(xstar)/(2*dfs{i}(xstar))).^(1./p_s))
        plot(1:length(C{i}),0.*C{i}+ddfs{i}(xstar)/(2*dfs{i}(xstar)))
        Legend(end+1 : end+2) = {...
            "$y = \frac{f''(x^*)}{2f'(x^*)}^{\frac{1}{p_s}}$ per $f_"+m+"$",...
            "$y = \frac{f''(x^*)}{2f'(x^*)}$ per $f_"+m+"$"...
            };
    end
    legend(Legend,'Interpreter','latex','FontSize',16)
    hold off
end
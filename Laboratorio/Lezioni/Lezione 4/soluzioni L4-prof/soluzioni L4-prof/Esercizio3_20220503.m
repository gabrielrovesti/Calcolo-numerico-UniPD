
clear all
close all
%% parametri globali
a=1;b=2;
method='m';
versione=1; % 1 per f=x^2-2, 2 per f=(x.^2-2).^3

 
switch versione
    case 1
        f=@(x) x.^2-2;
        toll=10^(-12);
    case 2
        f=@(x) (x.^2-2).^3;
        toll=10^(-4);
end
str=func2str(f);
funzione=str(5:end); % stringa con la definizione della funzione in testo da usare nella leggenda
%% punto 1
xplot=linspace(a,b);
figure(1);
plot(xplot,f(xplot));hold on
plot(xplot,0.*xplot); hold off
title(['Grafico della funzione considerata in [' num2str(a) ' , ' num2str(b) ']']);
legend(funzione,'asse x')
%% punto 2
[zero,res,wres,iterates,flag]=Bisezione(f,a,b,toll,method);

%% punto 3
switch flag
    case 'r'
        fprintf('algoritmo stoppato per criterio del residuo\n');
        fprintf('residuo pesato approssimato = %1.12e\n',wres);
        fprintf('numero iterazioni = %d\n',size(iterates,2));
        fprintf('errore finale =%1.12e\n', abs(sqrt(2)-zero));
       
    case 's'
        fprintf('algoritmo stoppato per criterio dello scarto\n');
        fprintf('ultimo scarto = %1.12e\n',iterates(1,end)-iterates(1,end-1));
        fprintf('numero iterazioni = %d\n',size(iterates,2));
        fprintf('errore finale =%1.12e\n', abs(sqrt(2)-zero));
    case 'b'
        fprintf('algoritmo stoppato per entrambi i criteri\n');
        fprintf('residuo pesato approssimato = %1.12e\n',wres);
        fprintf('ultimo scarto = %1.12e\n',iterates(1,end)-iterates(1,end-1));
        fprintf('numero iterazioni = %d\n',size(iterates,2));
        fprintf('errore finale =%1.12e\n', abs(sqrt(2)-zero));
    case 'f'
        fprintf('residuo nullo in numero finito di passi\n');
        fprintf('numero iterazioni = %d\n',size(iterates,2));
        fprintf('errore finale =%1.12e\n', abs(sqrt(2)-zero));
end

%% punto 4
err=abs(sqrt(2)-iterates(1,:));
res_abs=abs(f(iterates(1,:)));
figure(2);
semilogy(err);hold on;
semilogy(res_abs);
title(['Bisezione per ' funzione ' in [' num2str(a) ',' num2str(b) ']'])
legend('errore','residuo')

%%
figure(3);
plot(err./res_abs);
title('rapporto errori/residui')

if versione==1
    hold on 
    plot(ones(size(err))./(sqrt(2)*2))
    legend('errore/residuo', '1/df(sqrt(2))')
    hold off
end
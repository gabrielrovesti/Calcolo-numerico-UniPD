% ESEMPIO TEST SI VEDA PG 8 DELLE SLIDES DEL 27/04

close all
clear
f=@(x) x.^2-2;
df=@(x) 2.*x;
xstar=sqrt(2); 
toll=10^-7;
itmax=20;
x0=sqrt(2)-1+.001;
x1=sqrt(2)+1+.002;
method='s';
[zero_s,res_s,iterates_s,flag_s]=Secanti(f,x0,x1,toll,itmax,method);
s_s=iterates_s(2:end)-iterates_s(1:end-1);
err_s=abs(xstar-iterates_s);
fprintf('------------Metodo delle secanti-----------------------------\n')
fprintf('Numero di iterazioni = %d\n',length(iterates_s));
fprintf('Ultimo scarto = %1.12g\n',abs(s_s(end)));
fprintf('Ultima approssimazione = %1.12f\n',zero_s);
fprintf('Ultimo errore = %1.15g\n',abs(zero_s-xstar));
fprintf('Residuo = %1.12g\n',res_s(end));
fprintf('termine algoritmo per:\n')
switch flag_s
    case 's'
        fprintf('tolleranza raggiunta\n');
    case 'e'
        fprintf('numero di iterazioni\n');
end
[zero,res,iterates,flag]=Newton(f,df,x0,toll,itmax,method);
s=iterates(2:end)-iterates(1:end-1);
err=abs(iterates-xstar);
fprintf('------------Metodo di Newton --------------------------------\n')
fprintf('Numero di iterazioni = %d\n',length(iterates));
fprintf('Ultimo scarto = %1.12g\n',abs(s(end)));
fprintf('Ultima approssimazione = %1.12f\n',zero);
fprintf('Ultimo errore = %1.15g\n',abs(zero-xstar));
fprintf('Residuo = %1.12g\n',res(end));
fprintf('termine algoritmo per:\n')
switch flag
    case 's'
        fprintf('tolleranza raggiunta\n');
    case 'e'
        fprintf('numero di iterazioni\n');
end

figure(1);
semilogy(err_s);
hold on
semilogy(err);
title('confronto degli errori')
legend('Secanti','Newton')
p_s=(1+sqrt(5))/2;
C_s=abs(s_s(2:end))./abs(s_s(1:end-1)).^p_s;
C=abs(s(2:end))./(abs(s(1:end-1)).^2);
figure(2);
plot(C_s);
hold on
plot(C)
plot(1:length(C_s),0.*C_s+1/2)
plot(1:length(C),0.*C+1/(2*sqrt(2)))
title('approssimazione delle costanti asintotiche')
legend('approx cost asintotica secanti','approx cost asintotica Newton',...
    'valore teorico secanti','valore teorico Newton')
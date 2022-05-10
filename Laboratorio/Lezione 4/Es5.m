%% parametri globali
close all
clear
%%Punto 1: definizione funzioni
f1=@(x) x.^2-2; % m=1
f3=@(x) f1(x).^3; % m=3
f5=@(x) f1(x).^5; % m=5
%%Calcolo delle derivate
df1=@(x) 2.*x;
df3=@(x) 3.*f1(x).^2.*df1(x);
df5=@(x) 5.*f1(x).^4.*df1(x);

%%Punto 2:definizione dei parametri e chiamare 
%%nei casi 1,3,5 il criterio dello scarto
xstar=sqrt(2); % soluzione vera
toll=10^-8;
itmax=100;
x0=2;
method='s';

%% Calcolo con le funzioni e le derivate
%%e successivi plot
a=1; b=2; xplot=linspace(a,b);
yplot1=f1(xplot);
dyplot1=df1(xplot);
yplot3=f3(xplot);
dyplot3=df3(xplot);
yplot5=f5(xplot);
dyplot5=df5(xplot);

%%Plot prima funzione (f1)
F1=figure(1);
plot(xplot,yplot1)
hold on
plot(xplot,dyplot1)
%%Plot dell'asse x
plot(xplot,0*xplot)
legend('Funzione 1','Derivata di f1','Asse x')
title('F1 e sua derivata')
subtitle('m=1')
hold off

%%Plot seconda funzione (f3)
F2=figure(2);
plot(xplot,yplot3)
hold on
plot(xplot,dyplot3)
plot(xplot,0*xplot)
legend('Funzione 2','Derivata di f3','Asse x')
title('F3 e sua derivata')
subtitle('m=3')
hold off

%%Plot terza funzione (f5)
F3=figure(3);
plot(xplot,yplot5)
hold on
plot(xplot,dyplot5)
plot(xplot,0*xplot)
legend('Funzione 3','Derivata di f5','Asse x')
title('F5 e sua derivata')
subtitle('m=5')
hold off

%%Vado quindi a richiamare Newton nei 3 casi (completando il punto 2)
[zero1,res1,iterates1,flag1]=Newton(f1,df1,x0,toll,itmax,method);
[zero2,res3,iterates3,flag3]=Newton(f3,df3,x0,toll,itmax,method);
[zero5,res5,iterates5,flag5]=Newton(f5,df5,x0,toll,itmax,method);

%%Punto 3 

%%Calcolo del modulo dei residui
abs_res_vec_1=abs(f1(iterates1));
abs_res_vec_3=abs(f3(iterates3));
abs_res_vec_5=abs(f5(iterates5));

%%Calcolo degli errori ad ogni passo
err_1=abs(iterates1-xstar);
err_3=abs(iterates3-xstar);
err_5=abs(iterates5-xstar);

%%Calcolo del modulo degli scarti
s1=abs(iterates1(2:end)-iterates1(1:end-1));
s3=abs(iterates3(2:end)-iterates3(1:end-1));
s5=abs(iterates5(2:end)-iterates5(1:end-1));

%%Ora viene creata una figure 
%%per cominciare a disegnare il grafico semilogaritmico
%%disegnando per primo il modulo del residuo,
%%poi successivamente modulo scarto ed errore assieme
%%al residuo del passo in quel momento
figure()
semilogy(abs_res_vec_1,'b--');
hold on
semilogy(s1,'b:');
semilogy(err_1,'b');
semilogy(abs_res_vec_3,'g--');
semilogy(s3,'g:');
semilogy(err_3,'g');
semilogy(abs_res_vec_5,'k--');
semilogy(s5,'k:');
semilogy(err_5,'k');
hold off
title('Raffronto dei risultati')
legend('abs residuo m=1', 'scarto m=1','errore m=1',...
    'abs residuo m=3', 'scarto m=3','errore m=3',...
    'abs residuo m=5', 'scarto m=5','errore m=5','Location','South')

%% punto 4
figure()
semilogy(s1(2:end)./s1(1:end-1).^2,'b'); 
hold on
semilogy(s3(2:end)./s3(1:end-1),'g');
semilogy(2/3+ 0.*s3(2:end)./s3(1:end-1),'g:');
semilogy(s5(2:end)./s5(1:end-1),'k');
semilogy(4/5+ 0.*s5(2:end)./s5(1:end-1),'k:');
hold off
legend('s_{k+1}/{s_k}^p m=1, p=2','s_{k+1}/{s_k}^p m=3, p=1',...
    'limite teorico (m-1)/m=2/3','s_{k+1}/{s_k}^p m=5, p=1',...
    'limite teorico (m-1)/m=4/5','Location','South')
title('Check ordine di convergenza sperimentale')

%% punto 5
figure()
semilogy(err_1(2:end)./s1.^2,'b'); hold on
semilogy(err_3(2:end)./s3,'g');
semilogy(2+0.*err_3(2:end)./s3,'g:')
semilogy(err_5(2:end)./s5,'k');
semilogy(4+0.*err_5(2:end)./s5,'k:')
title('rapporto errore scarto');
legend('m=1','m=3','limite teorico=(m-1)=2','m=5','limite teorico=(m-1)=4')

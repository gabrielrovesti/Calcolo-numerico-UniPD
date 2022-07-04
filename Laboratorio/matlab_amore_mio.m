MATLAB AMORE MIO

%%Lezione 1 - Esercizio 1

voti=[18 19 22 18 27 19];
crediti=[6 6 9 6 9 9];
M=max(voti);m=min(voti);
mediana=(M+m)/2;
media=sum(voti)/length(voti);
mediapesata=(voti*crediti')/sum(crediti);
if length(voti)==length(crediti) && min(voti)>=18
    fprintf('il tuo voto massimo e''   %d\n',M);
    fprintf('il tuo voto minimo e''    %d\n',m);
    fprintf('la tua mediana e''      %7.2f\n',mediana);
    fprintf('la tua media e''        %7.2f\n',media);
    fprintf('la tua media pesata e'' %7.2f\n',mediapesata);
else
    fprintf('dati inseriti non consistenti\n')
end

%%Lezione 2 - Esercizio 2

voti=input('inserisci il vettore dei voti ');
crediti=input('inserisci il vettore dei crediti ');
M=max(voti);m=min(voti);
mediana=(M+m)/2;
media=sum(voti)/length(voti);
mediapesata=(voti*crediti')/sum(crediti);
if length(voti)==length(crediti) && min(voti)>=18
    fprintf('il tuo voto massimo e''   %d\n',M);
    fprintf('il tuo voto minimo e''    %d\n',m);
    fprintf('la tua mediana e''      %7.2f\n',mediana);
    fprintf('la tua media e''        %7.2f\n',media);
    fprintf('la tua media pesata e'' %7.2f\n',mediapesata);
else
    fprintf('dati inseriti non consistenti\n')
end

%%Lezione 2 - Esercizio 2.1
clear all;
%Pulisco lo script e vado agli input classici
a = input("Inserisci a: ");
b = input("Inserisci b: ");
c = input("Inserisci c: ");
%Queste sono le radici reali
x1_vera = input("Inserisci x1 vera: ");
x2_vera = input("Inserisci x2 vera: ");
if(a ~= 0 && b ~= 0 && c ~= 0)
    eq2gr;  %%Richiamo normalmente lo script
    eq2grst;
else
    error("Inseriti valori nulli");
end


%%Lezione 2 - Esercizio 2.1.a - eq2gr.m
clear;
close all;
fprintf("Risoluzione eq. secondo grado\n");
a=input("Inserire a:\n");
b=input("Inserire b:\n");
c=input("Inserire c:\n");
x1=0;x2=0;
if a ~= 0 && b ~= 0 && c ~= 0  
    delta=sqrt(b^2-4*a*c);
    if delta < 0
        fprintf("Nessuna soluzione reale\n");
    end
    if delta == 0
        x1=-b/2*a;
        x2=x1;
        fprintf("Soluzioni coincidenti\n");
        disp(x1);
        disp(x2);
    end
    x1=(-b-delta)/2*a;
    x2=(-b+delta)/2*a;
    fprintf("Soluzione x1: \n");
    disp(x1);
    fprintf("Soluzione x2: \n");
    disp(x2);
else
    fprintf("Errore\n");
end

%%Main chiamante
clear all;
%%Pulisco lo script e vado agli input classici
a = input("Inserisci a: ");
b = input("Inserisci b: ");
c = input("Inserisci c: ");
x1_vera = input("Inserisci x1 vera: ");
x2_vera = input("Inserisci x2 vera: ");
if(a ~= 0 && b ~= 0 && c ~= 0)
    eq2gr;  %%Richiamo normalmente lo script
    rel1 = abs(x1_vera - x1) / abs(x1_vera);
    rel2 = abs(x2_vera - x2) / abs(x2_vera);
    %%Calcolo gli errori relativi, con stampa alla c
    fprintf("Errore relativo x1 = %d\n", rel1);
    fprintf("Errore relativo x2 = %d\n", rel2);
else
    error("Inseriti valori nulli");
end

%%Lezione 2 - Esercizio 2.1.b - eq2grstab.m
clear;
delta = b^2 - 4*a*c;
if(delta == 0)
    x1=-b/(2*a);
    x2=x1;
    fprintf("Le soluzioni sono uguali: x1=x2= %e\n", x1);
elseif(delta > 0)       %%Qua ci metto la modifica per la stabilità per x1 ed x2
    x1=(-b+abs(b)*sqrt(delta))/(2*a);
    x2=(c/a*x1)/(2*a);
    fprintf("Soluzione x1: %e\n", x1);
    fprintf("Soluzione x2: %e\n", x2);
else
    error("No soluzioni");
end

%%Lezione 2 - Esercizio eq2grstab_all.m
if a==0
    if b==0
        x1=NaN; 
        x2=NaN;
    else
        x1=-c/b;   
        x2=x1
        fprintf("Equazione di primo grado: %e\n", x1);
    end
else
    delta = b^2 - 4*a*c;
    if delta < 0
        x1=NaN;
        x2=NaN;
        fprintf("Non ci sono soluzioni reali.\n");
    elseif delta == 0
        x1=-b/(2*a);
        x2=x1;
        fprintf("Soluzioni uguali: %e\n", x1);
    else
        if b==0
            x1=sqrt(-c / a);
            x2=-sqrt(-c / a);
            fprintf("x1 = %e\n", x1);
            fprintf("x2 = %e\n", x2);
        else
            x1 = -((b + sign(b)*sqrt(delta)) / (2 * a));
            x2 = c/(a * x1);
            fprintf("x1 = %e\n", x1);
            fprintf("x2 = %e\n", x2);
        end
    end
end
%%Main chiamante

clear all;
a = input("Inserisci a: ");
b = input("Inserisci b: ");
c = input("Inserisci c: ");
x1_vera = input("Inserisci x1 vera: ");
x2_vera = input("Inserisci x2 vera: ");

eq2grstab_all

rel1=abs(x1_vera - x1)/abs(x1_vera);
rel2=abs(x2_vera - x2)/abs(x2_vera);
fprintf("Errore relativo x1: %d\n", rel1);
fprintf("Errore relativo x1: %d\n", rel2);

%%Lezione 2 - Esercizio main2_3.m
clear all;
a = input("Inserisci a: ");
b = input("Inserisci b: ");
c = input("Inserisci c: ");
x1_vera = input("Inserisci x1 vera: ");
x2_vera = input("Inserisci x2 vera: ");

eq2grstab_all
rel1=abs(x1_vera - x1)/abs(x1_vera);
rel2=abs(x2_vera - x2)/abs(x2_vera);
%Creazione delle tabelle
A = [x1; rel1];
B = [x2; rel2];

%Scrittura su file con 
%successiva formattazione delle colonne
fileID = fopen('output2_3.txt','w');
fprintf(fileID,'%6s %12s\n','x1','Errore relativo x1');
fprintf(fileID,'%6.2f %12.8f\n',A);
fprintf(fileID,'%6s %12s\n','x2','Errore relativo x2');
fprintf(fileID,'%6.2f %12.8f\n',B);
fclose(fileID);


%%Lezione 4 - Esercizio 3

clear all;
close all;

a=1;b=2;
method='m';
versione=1; 
switch versione
    case 1
        f=@(x) x.^2-2;
        toll=10^(-12);
    case 2
        f=@(x) (x.^2-2).^3;
        toll=10^(-4);
end
str = func2str(f);
funzione = strrep(str(5:end),'.',''); 

xplot=linspace(a,b);
figure(1);
plot(xplot,f(xplot));hold on
plot(xplot,0.*xplot); hold off

title(['Grafico della funzione considerata in [' num2str(a) ' , ' num2str(b) ']']);
legend(funzione,'asse x')

[zero,res,wres,iterates,flag]=Bisezione(f,a,b,toll,method);

switch flag
    case 'r'
        fprintf('Algoritmo stoppato per criterio del residuo\n');
        fprintf('Residuo pesato approssimato = %1.12e\n',wres);
        fprintf('Numero iterazioni = %d\n',size(iterates,2));
        fprintf('Errore finale =%1.12e\n', abs(sqrt(2)-zero));
    case 's'
        fprintf('Algoritmo stoppato per criterio dello scarto\n');
        fprintf('Ultimo scarto = %1.12e\n',iterates(1,end)-iterates(1,end-1));
        fprintf('Numero iterazioni = %d\n',size(iterates,2));
        fprintf('Errore finale =%1.12e\n', abs(sqrt(2)-zero));
    case 'b'
        fprintf('Algoritmo stoppato per entrambi i criteri\n');
        fprintf('residuo pesato approssimato = %1.12e\n',wres);
        fprintf('Ultimo scarto = %1.12e\n',iterates(1,end)-iterates(1,end-1));
        fprintf('Numero iterazioni = %d\n',size(iterates,2));
        fprintf('Errore finale =%1.12e\n', abs(sqrt(2)-zero));
    case 'f'
        fprintf('Residuo nullo in numero finito di passi\n');
        fprintf('Numero iterazioni = %d\n',size(iterates,2));
        fprintf('Errore finale =%1.12e\n', abs(sqrt(2)-zero));
end
err=abs(sqrt(2)-iterates(1,:));
res_abs=abs(f(iterates(1,:)));
figure(2);
semilogy(err);hold on;
semilogy(res_abs);
title(['Bisezione per ' funzione ' in [' num2str(a) ',' num2str(b) ']'])
legend('Errore','Residuo')

figure(3);
plot(err./res_abs);	
title('Rapporto errori/residui')
if versione==1
    hold on
    plot(ones(size(err))./(sqrt(2)*2))
    legend('Errore/residuo', '1/df(sqrt(2))')
    hold off
end

%%Lezione 4 - Esercizio 5
% ESERCIZIO 3
%% parametri globali
close all
clear all
f1=@(x) x.^2-2; % m=1
f3=@(x) f1(x).^3; % m=3
f5=@(x) f1(x).^5; % m=5
df1=@(x) 2.*x;
ddf1=@(x) 2+0.*x;
df3=@(x) 3.*f1(x).^2.*df1(x);
df5=@(x) 5.*f1(x).^4.*df1(x);
xstar=sqrt(2); % soluzione vera
toll=10^-8;
itmax=100;
x0=2;x1=1;
method='s';
%% punto 1
a=1; b=2; xplot=linspace(1,2);
yplot1=f1(xplot);
dyplot1=df1(xplot);
yplot3=f3(xplot);
dyplot3=df3(xplot);
yplot5=f5(xplot);
dyplot5=df5(xplot);

F1=figure(1);
plot(xplot,yplot1)
hold on
plot(xplot,dyplot1)
plot(xplot,0*xplot)
legend('f1','df1','asse x')
title('funzione e derivata')
subtitle('m=1')
hold off

F2=figure(2);
plot(xplot,yplot3)
hold on
plot(xplot,dyplot3)
plot(xplot,0*xplot)
legend('f3','df3','asse x')
title('funzione e derivata')
subtitle('m=3')
hold off

F3=figure(3);
plot(xplot,yplot5)
hold on
plot(xplot,dyplot5)
plot(xplot,0*xplot)
legend('f5','df5','asse x')
title('funzione e derivata')
subtitle('m=5')
hold off

%% punto 2
[zero1,res1,iterates1,flag1]=Newton(f1,df1,x0,toll,itmax,method);
[zero2,res3,iterates3,flag3]=Newton(f3,df3,x0,toll,itmax,method);
[zero4,res5,iterates5,flag5]=Newton(f5,df5,x0,toll,itmax,method);

%% punto 3  
abs_res_vec_1=abs(f1(iterates1));
abs_res_vec_3=abs(f3(iterates3));
abs_res_vec_5=abs(f5(iterates5));
err_1=abs(iterates1-xstar);
err_3=abs(iterates3-xstar);
err_5=abs(iterates5-xstar);
s1=abs(iterates1(2:end)-iterates1(1:end-1));
s3=abs(iterates3(2:end)-iterates3(1:end-1));
s5=abs(iterates5(2:end)-iterates5(1:end-1));

figure()
semilogy(abs_res_vec_1,'b--');hold on
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
semilogy(s1(2:end)./s1(1:end-1).^2,'b'); hold on
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
semilogy(err_1(2:end)./(s1.^2),'b'); hold on
semilogy(err_3(2:end)./s3,'g');
semilogy(2+0.*err_3(2:end)./s3,'g:')
semilogy(err_5(2:end)./s5,'k');
semilogy(4+0.*err_5(2:end)./s5,'k:')
title('rapporto errore scarto');
legend('m=1','m=3','limite teorico=(m-1)=2','m=5','limite teorico=(m-1)=4')

%%Lezione 4 - Esercizio 6
%% parametri globali
close all
clear all
c=0.01;
f = @(x) exp(1 - 1./x) - exp(1) + c;
df = @(x) exp(1 - 1./x)./(x.^2);
ddf = @(x) exp(1 - 1./x).*(1 - 2.*x)./(x.^2);
cN= @(x) abs(ddf(x)./(2*df(x)));
xstar=1/(1-log(exp(1)-c)); % soluzione vera
toll=10^-8;
itmax=100;
x0=1/(2*c);
method1='s';    method2='r';
%% punto 1
a=1/(2*c); b=5/c; xplot=linspace(a,b);
yplot=f(xplot);
dyplot=df(xplot);

F1=figure(1);
plot(xplot,yplot)
hold on
plot(xplot,dyplot)
plot(xplot,0*xplot)
legend('f','df','asse x')
title('funzione e derivata')
hold off

%% punto 2
[zeroB,resB,wresB,iteratesB,flagB]=Bisezione(f,a,b,toll,method1);
[zeroN,resN,iteratesN,flagN]=Newton(f,df,x0,toll,itmax,method2);

%% punto 3  
abs_res_vec_B=abs(f(iteratesB(1,:)));
abs_res_vec_N=abs(f(iteratesN));

err_B=abs(iteratesB(1,:)-xstar);
err_N=abs(iteratesN-xstar);

sB=abs(iteratesB(1,2:end)-iteratesB(1,1:end-1));
sN=abs(iteratesN(2:end)-iteratesN(1:end-1));

figure(2)
semilogy(abs_res_vec_B,'b--');
hold on
semilogy(sB,'b:');
semilogy(err_B,'b');
semilogy(abs_res_vec_N,'g--');
semilogy(sN,'g:');
semilogy(err_N,'g');
title('Raffronto dei risultati')
legend('abs residuo bisezione', 'scarto bisezione','errore bisezione',...
    'abs residuo newton', 'scarto newton','errore newton')
hold off

%% punto 5
figure(3)
semilogy(err_B(2:end)./sB,'b');
hold on
semilogy(err_N(2:end)./(sN.^2),'g');

semilogy(1/cN(xstar)+0.*err_N(2:end)./(sN.^2),'r:');
title('rapporto errore scarto');
legend('bisezione p=1','newton p=2','limite teorico')
hold off

%%Lezione 5 - Esercizio 1

clear all
close all
clc
warning off
% dati globali
f=@(x) 1./(25*x.^2+1);
a=-1;b=1; % estremi intervallo
m=5001; % num punti valutazione
degs=2:2:100; % gradi polinomiali considerati
pausa=0.2;
stable=0;
%% corpo dell'esperimento
xeval=linspace(a,b,5001);
f_eval=f(xeval)';
E_equi=[];
E_cheb=[];
E_equi_matlab=[];
E_cheb_matlab=[];
E_rieval_equi=[];
E_rieval_cheb=[];
E_rieval_equi_matlab=[];
E_rieval_cheb_matlab=[];
for n=degs
    xinterp_equi=linspace(a,b,n+1)';
    yinterp_equi=f(xinterp_equi);
    xinterp_cheb=cos((n:-1:0)'./n*pi); % pti di Gauss-Chebyshev
    yinterp_cheb=f(xinterp_cheb);

    L_equi=LagrangePoly(xinterp_equi,xeval);
    L_cheb=LagrangePoly(xinterp_cheb,xeval);
    L_rieval_equi=LagrangePoly(xinterp_equi,xinterp_equi);
    L_rieval_cheb=LagrangePoly(xinterp_cheb,xinterp_cheb);

    yeval_equi=L_equi*yinterp_equi;
    yeval_cheb=L_cheb*yinterp_cheb;

    c_equi=polyfit(xinterp_equi,yinterp_equi,n);
    c_cheb=polyfit(xinterp_cheb,yinterp_cheb,n);

    yeval_equi_matlab=polyval(c_equi,xeval);
    yeval_cheb_matlab=polyval(c_cheb,xeval);

    yrieval_equi=L_rieval_equi*yinterp_equi;
    yrieval_cheb=L_rieval_cheb*yinterp_cheb;

    yrieval_equi_matlab=polyval(c_equi,xinterp_equi); %teoricamente = a yeval_..
    yrieval_cheb_matlab=polyval(c_cheb,xinterp_cheb);

% errori su punti di valutazione
    E_equi=[E_equi,max(abs(yeval_equi-f_eval))];
    E_cheb=[E_cheb,max(abs(yeval_cheb-f_eval))];
    E_equi_matlab=[E_equi_matlab,max(abs(yeval_equi_matlab'-f_eval))];
    E_cheb_matlab=[E_cheb_matlab,max(abs(yeval_cheb_matlab'-f_eval))];
% errori sui punti di interpolazione
    E_rieval_equi=[E_rieval_equi,max(abs(yrieval_equi-yinterp_equi))];
    E_rieval_cheb=[E_rieval_cheb,max(abs(yrieval_cheb-yinterp_cheb))];
    E_rieval_equi_matlab=[E_rieval_equi_matlab,max(abs(yrieval_equi_matlab-yinterp_equi))];
    E_rieval_cheb_matlab=[E_rieval_cheb_matlab,max(abs(yrieval_cheb_matlab-yinterp_cheb))];
end
%% grafico errori
figure(2);
subplot(1,2,1);
semilogy(degs,E_equi,'r');
hold on
semilogy(degs,E_cheb,'g');
semilogy(degs,E_equi_matlab,'r--');
semilogy(degs,E_cheb_matlab,'g--');
xlabel('grado di interpolazione');
ylabel('errore assoluto')
legend('err interp equi Lagrange','err interp Cheb Lagrange',...
    'err interp equi matlab','err interp Cheb matlab');
title('Errori su punti di valutazione')
hold off
subplot(1,2,2);
semilogy(degs,E_rieval_equi,'r');
hold on
semilogy(degs,E_rieval_cheb,'g');
semilogy(degs,E_rieval_equi_matlab,'r--');
semilogy(degs,E_rieval_cheb_matlab,'g--');
legend('err interp equi Lagrange','err interp Cheb Lagrange',...
    'err interp equi matlab','err interp Cheb matlab','Location','southeast');
title('errori sui punti di interpolazione')
%% stampa a video
A=[degs;E_equi;E_cheb;E_equi_matlab;E_cheb_matlab];
fprintf('Interpolazione della f. di Runge\n')
fprintf('-----------------------------------------------------\n')
fprintf(['Parametri: ' num2str(m) ' punti di valutazione\n'])
fprintf('-----------------------------------------------------\n')
fprintf('Risultati:\n')
fprintf('|grado|\t |err interp equi   |\t |err interp cheb   |\t |err interp equi mat|\t |err interp cheb mat|\n')
fprintf('-----------------------------------------------------\n')
fprintf('|%5d|\t |%1.12e|\t |%1.12e|\t |%1.12e|\t |%1.12e| \n',A)

%%Lezione 5 - Esercizio 2

clear all
close all
clc
warning off
degs=1:20;
M=1000;
teta=0.001;
xeval=2;
f=@(x) exp(sin(x));
%%
k=0;
for n=degs
    k=k+1;

    xinterp_equi=linspace(-1,1,n+1)';
    xinterp_cheb=cos((2*(n:-1:0)+1)./(2*n+2)*pi)';

    yinterp_equi_true=f(xinterp_equi);
    yinterp_cheb_true=f(xinterp_cheb);
    yeval_true=f(xeval);

    L_equi=LagrangePoly(xinterp_equi,xeval);
    L_cheb=LagrangePoly(xinterp_cheb,xeval);

    yinterp_equi=yinterp_equi_true+teta*randn(n+1,M);
    yinterp_cheb=yinterp_cheb_true+teta*randn(n+1,M);
    yeval_equi=L_equi*yinterp_equi;
    yeval_cheb=L_cheb*yinterp_cheb;

    err_equi(k)=mean(abs(yeval_equi-yeval_true));
    err_cheb(k)=mean(abs(yeval_cheb-yeval_true));
    var_err_equi(k)=var(abs(yeval_equi-yeval_true));
    var_err_cheb(k)=var(abs(yeval_cheb-yeval_true));
end

figure(1);
semilogy(degs,err_equi);
hold on
semilogy(degs,err_cheb);
legend('Errore medio equi','Errore medio Cheb');
title('medie degli errori');
figure(2);
semilogy(degs,var_err_equi);
hold on
semilogy(degs,var_err_cheb);
legend('Varianza errore equi','Varianza errore Cheb');
title('varianze degli errori')

%%Lezione 6 - Esercizio 1

% Help: MyPolyfit
% Calcolo coefficienti del polinomio approssimante
% e valutazione sui nodi xeval seguendo il metodo QR
%
% INPUT
% xfit      double [m x 1] nodi di approssimazione
% xeval     double [M X 1] nodi di valutazione
% yfit      double [m x 1] dati da fittare
% deg       grado di approssimazione polinomiale
%---------------------------------------------------------------------------
%OUTPUT
% peval     double [m x 1] polinomio valutato sulla successione
% c         double [m x 1] calcolo dei coefficienti dela sost. all'indietro
%----------------------------------------------------------------------------

function [peval,c]=MyPolyfit(xfit,xeval,yfit,deg)
    V=chebvand1d(deg,xfit);
    Veval=chebvand1d(deg,xeval);
    [Q,R]=qr(V);
    R0=R(1:size(V,2),:);
    Q0=Q(:,1:size(V,2));
    b=Q0' * yfit;
    c=SostituzioneIndietro(R0,b);
    peval=Veval*c;
end

%% Lezione 6 - Esercizio 2
clear all
close all
f=@(x) 1./(25.*x.^2 + 1);
xfit=linspace(-1,1,2001)';
xeval=linspace(-1,1,10000)';
yfit=f(xfit);
yeval=f(xeval);
degs=2:2:150;
k=1;
for n=degs
    peval=MyPolyfit(xfit,xeval,yfit,n);
    err(k)=max(abs(peval-yeval));
    k=k+1;
end
semilogy(degs,err)
title('Errore punti di valutazione');
legend('Errore equispaziati');

%%Lezione 6 - Esercizio 3
clear all
close all

f=@(x) 1./(25*x.^2+1);
xfit=linspace(-1,1,2001)';
xfit1=cos(pi*(1+xfit)/2);
xeval=linspace(-1,1,10000)';
yfit=f(xfit);
yfit1=f(xfit1);
yeval=f(xeval);
degs=2:2:150;
k=1;
for n=degs
    peval=MyPolyfit(xfit,xeval,yfit,n);
    peval1=MyPolyfit(xfit1,xeval,yfit1,n);
    err(k)=max(abs(peval-yeval));
    err1(k)=max(abs(peval1-yeval));
    k=k+1;
end
%%
semilogy(degs,err,'k')
hold on
semilogy(degs,err1,'g');
title('Massimo errore sui punti di valutazione');
legend('Errore equispaziati','Errore Chebyshev');

%%Lezione 6 - Esercizio 4
function [peval,c]=MyPolyfit_unstable(xfit,xeval,yfit,deg)
% Help: MyPolyfit_unstable
% Calcolo coefficienti del polinomio approssimante
% sulla base canonica e valutazione sui nodi xeval 
% risolvendo le equazioni normali con backslash
%
% INPUT
% xfit      double [m x 1] nodi di approssimazione
% xeval     double [M X 1] nodi di valutazione
% yfit      double [m x 1] dati da fittare
% deg       grado di approssimazione polinomiale
%---------------------------------------------------------------------------
% OUTPUT
% peval     double [m x 1] polinomio valutato sulla successione
% c         double [m x 1] calcolo dei coefficienti dela sost. all'indietro
%----------------------------------------------------------------------------
V=xfit.^(0:deg);
Veval=xeval.^(0:deg);
G=V' * V;
z=V' * yfit;
c=G\z;
peval=Veval*c;
end
    
%%Lezione 6 - Esercizio 5

clear all
close all

%f=@(x) 1./(25*x.^2+1);
f=@(x) exp(1).^(-1./(1-x.^2));
%f=@(x) sin(pi*x)
xfit=linspace(-1,1,2001)';
xfit1=cos(pi*(1+xfit)/2);
xeval=linspace(-1,1,10000)';
yfit=f(xfit);
yfit1=f(xfit1);
yeval=f(xeval);
degs=2:2:150;
k=1;
%%
for n=degs
    peval=MyPolyfit(xfit,xeval,yfit,n);
    peval_unstable=MyPolyfit_unstable(xfit,xeval,yfit,n);
    peval1=MyPolyfit(xfit1,xeval,yfit1,n);
    peval_unstable1=MyPolyfit_unstable(xfit1,xeval,yfit1,n);
    err(k)=max(abs(peval-yeval));
    err_unstable(k)=max(abs(peval_unstable-yeval));
    err1(k)=max(abs(peval1-yeval));
    err_unstable1(k)=max(abs(peval_unstable1-yeval));
    k=k+1;
end
%%
semilogy(degs,err)
hold on
semilogy(degs,err_unstable,'--')
semilogy(degs,err1,'g');
semilogy(degs,err_unstable1,'-.')
legend('cheb basis unif points','can basis unif points',...
       'cheb basis cheb points','can basis cheb points')

%%Lezione 7 - Esercizio 1

clear all
close all
f=@(x) sin(x);
a=0;b=pi/2;
intvero=1;

ks=1:15;
It=zeros(1,length(ks));Ip=It;
h=(b-a)./(2*ks);
%%
for k=ks
    [xt,wt]=Trapezi(a,b,2*k);
    [xp,wp]=Parabole(a,b,k);
    It(k)=wt*f(xt);
    Ip(k)=wp*f(xp);
end

figure(1);
semilogy(2*ks+1,abs(intvero-It),'b');hold on
semilogy(2*ks+1,h.^2,'--b');
semilogy(2*ks+1,abs(intvero-Ip),'r');
semilogy(2*ks+1,h.^4,'--r');
legend('err trap','h^2','err parab', 'h^4')
title(['Errori di quadratura di f su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off

%%Lezione 7 - Esercizio 2

function [integrale,I,step,flag]=MyQuad(a,b,f,formula,toll,maxN)
% Help: MyQuad
% Calcolo della quadratura di f con 2N intervalli
% rispettando una soglia di tolleranza e 
% il numero di sottointervalli previsti
% --------------------------------------------------------------------------
% INPUT
% a         double [1 x 1]      Estremo inferiore di integrazione
% b         double [1 x 1]      Estremo superiore di integrazione
% f         function handle     Funzione di cui calcolare la quadratura
% formula   function handle     Formula (Trapezi/Parabole) da usare nel
%                               calcolo della quadratura
% toll      double [1 x 1]      Soglia di tolleranza
% maxN      int [1 x 1]         Numero massimo di iterazioni
%---------------------------------------------------------------------------
% OUTPUT
% integrale     double [m x 1]  Ultima approssimazione integrale
% I             double [m x 1]  Successione delle approssimazioni    
% step          double [1 x 1]  Ultima differenza tra approssimazioni
% flag          int [1 x 1]     Segnala se è stata raggiunta la tolleranza         
%----------------------------------------------------------------------------

    N=1;flag=0;
    [x,w]=formula(a,b,N);
    I=w*f(x);
    step=toll+1;
    while step>toll && N<maxN/2
        N=2*N;
        [x,w]=formula(a,b,N);
        I=[I,w*f(x)];
        step=abs(I(end)-I(end-1));
    end
    integrale=I(end);
    if abs(step)<toll
        flag=1;
end
    
%%Lezione 7 - Esercizio 3

clear all
close all
f=@(x) sin(x);
a=0;b=pi/2;
intvero=1;

ks=1:30;
It=zeros(1,length(ks));Ip=It;
h=(b-a)./(2*ks);
Nmax=1000;
toll=10^-7;
%%
for k=ks
    N=k;
    [xt,wt]=Trapezi(a,b,2*N);
    [xp,wp]=Parabole(a,b,N);
    n=length(xp)-1;
    xequi=linspace(a,b,n+1)';
    xcheb=(a+b)/2+(b-a)/2*cos((2*(n-1:-1:0)+1)./(2*n+1)*pi)';
    wequi=FormulaInterpolatoria(xequi,a,b,toll,Nmax);
    wcheb=FormulaInterpolatoria(xcheb,a,b,toll,Nmax);
    It(k)=wt*f(xt);
    Ip(k)=wp*f(xp);
    Iequi(k)=wequi*f(xequi);
    Icheb(k)=wcheb*f(xcheb);
end

figure(1);
semilogy(2*ks+1,abs(intvero-It),'b');hold on
semilogy(2*ks+1,abs(intvero-Iequi),'g')
%semilogy(2*ks+1,h.^2,'--b');
semilogy(2*ks+1,abs(intvero-Ip),'r');
semilogy(2*ks+1,abs(intvero-Icheb),'k')
%semilogy(2*ks+1,h.^4,'--r');
legend('err trap','err equi','err parab', 'err cheb')
title(['Errori di quadratura di f su [0,pi/2]'])
xlabel('num punti di quadratura')
hold off

%%Lezione 8 - Esercizio 1
clear all
close all
clc
eps=10^-15;
for n=2:20
    z=linspace(-1, 1, n);
    A=vander(z) + eps * eye(n);
    b = A * ones(n, 1);
    [L U P]=lu(A);
    [Lnopiv, Unopiv]=LUnoPiv(A);
    [L U P]=lu(A);
    xpiv=SostituzioneIndietro(U, SostituzioneAvanti(L, P*b));
    xnopiv=SostituzioneIndietro(Unopiv, SostituzioneIndietro(Lnopiv, b));

    errpiv(n)=norm(ones(n, 1) - norm(xpiv));
    errnopiv(n)=norm(ones(n, 1) - norm(xpiv));
    errfattU(n)=norm(U - triu(U));
    errfattUnopiv(n)=norm(Unopiv - triu(Unopiv))
end
figure(1);
semilogy(errnopiv)
hold on
semilogy(errpiv)
grid on
legend('lu senza pivoting','lu con pivoting')
title('Confronto degi errori sulla soluzione')
figure(2);
semilogy(errfattUnopiv)
hold on
semilogy(errfattU)
title('confronto degli errori sulla fattorizzazione')

%%Lezione 8 - Esercizio 2
clear all
close all
eps=10^-15;
for n=2:20
    x=linspace(-1,1,n);
    A=vander(x)+eps*eye(n);
    b=A*ones(n,1);
    [Lnopiv, Unopiv] = LUnoPiv(A);
    [L, U, P]=lu(A);
    xnopiv=SostituzioneIndietro(Unopiv,SostituzioneAvanti(Lnopiv,b));    
    xpiv=SostituzioneIndietro(U,SostituzioneAvanti(L,P*b));
    xbackslash=A\b;

    errnopiv(n)=norm(ones(n,1)-xnopiv);
    errpiv(n)=norm(ones(n,1)-xpiv);
    errbackslash(n)=norm(xbackslash-ones(n,1));
    errfattUnopiv(n)=norm(Unopiv-triu(Unopiv));
    errfattU(n)=norm(U-triu(U));
end
figure(1);
semilogy(errnopiv)
hold on
semilogy(errpiv)
semilogy(errbackslash)
grid on
legend('lu senza pivoting','lu con pivoting','backslash')
title('Confronto degi errori sulla soluzione')
figure(2);
semilogy(errfattUnopiv)
hold on
semilogy(errfattU)
title('confronto degli errori sulla fattorizzazione')

%%Lezione 8 - Esercizio 3
clear all
close all
eps=10^-15;
for n=2:20
    x=linspace(-1,1,n);
    A=vander(x)+eps*eye(n);
    b=A*ones(n,1);
    [Lnopiv, Unopiv] = LUnoPiv(A);
    [L, U, P]=lu(A);
    xnopiv=SostituzioneIndietro(Unopiv,SostituzioneAvanti(Lnopiv,b));    
    xpiv=SostituzioneIndietro(U,SostituzioneAvanti(L,P*b));
    xbackslash=A\b;

    errnopiv(n)=norm(ones(n,1)-xnopiv)/norm(ones(n,1));
    errpiv(n)=norm(ones(n,1)-xpiv)/norm(ones(n,1));
    errbackslash(n)=norm(xbackslash-ones(n,1))/norm(ones(n,1));

    resnopiv(n)=norm(A*xnopiv-b)/norm(b);
    respiv(n)=norm(A*xpiv-b)/norm(b);
    resbackslash(n)=norm(A*xbackslash-b)/norm(b);
    K(n)=cond(A);
end
%%plot di tutto
figure(1);
semilogy(errnopiv)
hold on
semilogy(errpiv)
semilogy(errbackslash)
semilogy(resnopiv)
semilogy(respiv)
semilogy(resbackslash)
semilogy(K)
grid on
legend('err rel lu senza pivoting','err rel lu con pivoting','err rel backslash',...
    'res rel lu senza pivoting','res rel lu con pivoting','res rel backslash',...
    'cond(A)')
title('Confronto degi errori sulla soluzione')

%%Lezione 8 - Esercizio 4
function A1=myInv(A)
    [L, U, P]=lu(A);
    A1=U\(L\P);
end

%%Lezione 8 - Esercizio 4.1
function x=SostituzioneAvantiBis(L,B)
    toll=10^-12;
    if norm(L-tril(L))>toll
        error('La matrice deve essere triangolare inferiore')
    end
    if min(abs(diag(L)))==0
        error('Matrice singolare')
    end
    n=size(L,1);
    x=zeros(size(B));

    x(1,:)=B(1,:)/L(1,1);	
    for k=1:n-1
        x(k+1,:)=(B(k+1,:)-L(k+1,:)*x)./L(k+1,k+1);
    end
end 

function x=SostituzioneIndietroBis(U,B)
    if min(abs(diag(U)))==0
        error('Matrice singolare')
    end
    n=size(U,1);
    x=zeros(size(B));
    x(n,:)=B(end,:)/U(n,n);
    for k=1:n-1
        x(n-k,:)=(B(n-k,:)-U(n-k,:)*x)./U(n-k,n-k);
    end
end

function A1 = Inv(A)
    A1 = zeros(size(A));
    [L,U,P] = lu(A);
    B = eye(size(A));
    y = SostituzioneAvantiBis(L,P*B);
    A1 = SostituzioneIndietroBis(U,y);
end

%%Lezione 8 - Esercizio 5
clear all
close all
eps=10^-15;
for n=2:20
    x=linspace(-1,1,n);
    A=vander(x)+eps*eye(n);
    b=A*ones(n,1);
    [Lnopiv, Unopiv] = LUnoPiv(A);
    [L, U, P]=lu(A);
    xnopiv=SostituzioneIndietro(Unopiv,SostituzioneAvanti(Lnopiv,b));    
    xpiv=SostituzioneIndietro(U,SostituzioneAvanti(L,P*b));
    xbackslash=A\b;

    errnopiv(n)=norm(ones(n,1)-xnopiv);
    errpiv(n)=norm(ones(n,1)-xpiv);
    errbackslash(n)=norm(xbackslash-ones(n,1));
    resnopiv(n)=norm(A*xnopiv-b);
    respiv(n)=norm(A*xpiv-b);
    
    normA1(n)=norm(myInv(A));
    resbackslash(n)=norm(A*xbackslash-b);
end
%%
figure(1);
semilogy(errnopiv)
hold on
semilogy(errpiv)
semilogy(errbackslash)
semilogy(resnopiv)
semilogy(respiv)
semilogy(resbackslash)
semilogy(normA1)
grid on
legend('err ass lu senza pivoting','err ass lu con pivoting','err ass backslash',...
    'res ass lu senza pivoting','res ass lu con pivoting','res ass backslash',...
    'norm(inv(A))','Location','NorthWest')
title('Confronto degi errori sulla soluzione')

%%Appello 1 - Atto 1

clear all
close all
clc
warning off

f=@(x) (x~=0).*(x.^2 - 1).*(log(x + 1) - x);
df=@(x) 2*x.*(log(x+1)-x)-(x.^2-1).*x./(x+1);
x0=-0.6;
toll=1e-4;
itmax=100;
[zero, res, iterates, flag]=Newton(f, df, x0, toll, itmax, method);
steps=abs(iterates(2:end)-iterates(1:end-1));
figure(1)
semilogy(steps)
hold on
semilogy(abs(iterates))
legend('Scarti','Residui')
title('Profilo di convergenza Newton')

[zeromod, resmod, iteratesmod, flagmod]=Newton(f, df, x0, m, toll, itmax, method);
stepsmod=abs(iteratesmod(2:end) - iterates(1:end-1));
figure(2);
semilogy(stepsmod)
hold on
semilogy(abs(iteratesmod));
legend('Scarti','Residui')
title('Profilo di convergenza Newton Modificato')
fprintf('Premi un tasto per vedere anche punto facoltativo\n')
pause()

%%Appello 1 - Atto 2

clear all
close all
clc

%%punto 1
f=@(x) (x.^2-1).*(log(x+1)-x);
df=@(x) 2*x.*(log(x+1)-x)-(x.^2-1).*x./(x+1);
n=8;
xinterp=0.5*cos((0:n)./n*pi);
yinterp=f(xinterp)';
c=polyfit(xinterp, yinterp, n);

%%punto 2
cder=c(1:end-1).^(n:-1:1);

%%punto 3
p=@(x) polyval(c, x);
pder=@(x) polyval(cder, x);

%%punto 4 – uguale a prima
x0=-0.6;
toll=10^-12;
itmax=100;
method='s';
[zero,res,iterates,flag]=Newton(p,dp,x0,toll,itmax,method);
steps=abs(iterates(2:end)-iterates(1:end-1));
figure(4);
semilogy(steps)
hold on
semilogy(abs(iterates))
legend('Scarti','Residui')
title('Profilo di convergenza Newton')
fprintf('Effetto 1: non c''è instabilità\n')
fprintf('Effetto 2: lo zero del polinomio è semplice, Newton converge quadraticamente\n')

%%Appello 2 - Atto 1

function [x, w]=FormulaEquispaziata(a, b, n)
%%HELP - FormulaEquispaziata
%Function che calcola il vettore riga dei nodi di interpolazione
%e il vettore colonna dei pesi
%---------------------------------------------------------------
%INPUT
% a     [1 x 1] scalare     estremo inferiore 
% b     [1 x 1] scalare     estremo superiore 
% n     [1 x 1] scalare     grado di precisione polinomiale
%---------------------------------------------------------------
%OUTPUT
% x     [1 x n]             vettore riga dei nodi
% w     [n x 1]             vettore colonna dei pesi
%---------------------------------------------------------------

x=linspace(a, b, n+1);
V=x^((0:n)'');
c=(b.^((1:n+1)')-a.^((1:n+1)'))./((1:n+1)');
[L,U,P]=lu(A);
w=U\(L\(P*c));
end

%%Appello 2 - Atto 2

function [x, w]=FormulaEquispaziataComposta(a, b, N, n)
%%HELP - FormulaEquispaziataComposta
%Function che calcola la formula di quadratura composta
%in N sottointervalli in [a, b] rispetto al grado n
%---------------------------------------------------------------
%INPUT
% a     [1 x 1] scalare     estremo inferiore 
% b     [1 x 1] scalare     estremo superiore 
% N     [1 x 1] scalare     numero di sottointervalli
% n     [1 x 1] scalare     grado di precisione polinomiale
%---------------------------------------------------------------
%OUTPUT
% x     [1 x n]             vettore riga degli N*n+1 nodi
% w     [n x 1]             vettore colonna degli N*n+1 pesi
%---------------------------------------------------------------

pts=linspace(a, b, N+1);
x = zeros(1, N*n+1);
y=x';
for i=1:N
    [xloc, wloc]=FormulaEquispaziata(pts(k), pts(k+1), n);
    x(n*(k-1)+1:n*k+1)=xloc;
    w(n*(k-1)+1:n*k+1)=wloc+x(n*(k-1)+1:n*k+1);
end
end

%%Appello 2 - Atto 3

clear all
close all
clc
warning off

a=0; b=1; f=@(x) sqrt(x);
for s=1:50
    N1=2; n1=s;
    N2=s; n2=2;
    [x1, w1]=FormulaEquispaziataComposta(a, b, N1, n1);
    [x2, w2]=FormulaEquispaziataComposta(a, b, N2, n2);
    I1(s)=w1*f(x1);
    I2(s)=w2*f(x2);
    %facoltativo: fattori di stabilità
    L1(s)=sum(abs(w1));
    L2(s)=sum(abs(w2));
end

figure(1);
semilogy(abs(I1 - 2/3));
hold on
semilogy(abs(I2 - 2/3));
title('Errori di quadratura')
legend('N=2, n=1,2,..,50', 'N=1,2,...,50, n=2')
% parte facoltativa
figure(2);
semilogy(L1);
hold on
semilogy(L2)
title('fattori di stabilità')
legend('N=2, n=1,2,..,50', 'N=1,2,...,50, n=2')
fprintf('Le formule a grado alto diventano molto instabili\n')

%%Recupero 1 Secondo Appello - Atto 1
%%HELP - MyQRInv
%Function che calcola l'inversa della matrice A
%---------------------------------------------------------------
%INPUT
% A     [N x N] matrice     Matrice di cui calcolare
%                           l'inversa
% toll  [1 x 1] scalare     Soglia di tolleranza
%---------------------------------------------------------------
%OUTPUT
% Ainv  [N x N] matrice     Matrice inversa
%---------------------------------------------------------------
function Ainv=MyQRInv(A, toll)
    [Q, R]=qr(A);
    if min(abs(diag(R)))<toll 
        error('Errore');
    end
else
    for i=1:size(Q', 2);
        AInv(:, i)=SostituzioneIndietro(R, Q(:, i)');
    end
end

%%Recupero 1 Secondo Appello - Atto 2
function Kappa = MyCond(A, p, toll)
%%HELP - MyCond
%Function che calcola il condizionamento della matrice A ||A*Ainv||
%------------------------------------------------------------------
%INPUT
% A     [N x N] matrice     Matrice di cui calcolare
%				  il condizionamento
% p     [1 x 1] scalare     Fattore di decisione per la norma
% toll  [1 x 1] scalare     Soglia di tolleranza
%------------------------------------------------------------------
%OUTPUT
% Kappa [1 x 1] scalare     Fattore di condizionamento di A
%------------------------------------------------------------------

Ainv=MyQRInv(A, toll);
switch p
case 1
    Kappa=norm(A, 1)*norm(Ainv, 1);
case Inf
    Kappa=norm(A, Inf)*norm(Ainv, Inf);
end
end

%%Recupero 1 Secondo Appello - Atto 3
clear all
close all
clc
warning off

toll=1e-18;
for n=1:30
    A=hilb(n);
    Ainv=MyQRInv(A, 1, toll);
    Kappa1(n)=Kappa(A, 1, toll);
    KappaInf(n)=Kappa(A, Inf, toll);

    b=A*ones(1, size(A, 1))';
    [L, U, P]=lu(A);
    x1=U\(L\(P*b));

    [L, U, P]=lu(Ainv);
    xinf=U\(L\(P*b));

    E1=norm(ones(n, 1)-x1);
    Einf=norm(ones(n, 1)-xinf);
end
figure(1);
semilogy(eps*Kappa1);
hold on;
semilogy(eps*KappaInf);
semilogy(E1);
semilogy(Einf);
hold off;
title('Condizionamento per norma 1 e norma infinito);
legend('eps*Kappa1','eps*KappaInf','E1','Einf');

%%Recupero 2 Secondo Appello - Atto 1
function [peval,coeff]=MyFit(xsample,ysample,deg,xeval,method)
% HELP - MyFit
% calcola valutazione del polinomio di miglior approssimazione ai minimi 
% quadrati e suoi coefficienti rispetto a base monomiale decrescente in 
% grado, eventualmente scalata se method=4.
% INPUT--------------------------------------------------------------------
% xsample       vettore colonna [Mx1] con i dati x
% ysample       vettore colonna [Mx1] con i dati y
% deg           scalare (intero positivo < M) grado massimo polinomio
% xeval         vettore colonna [Nx1] punti di valutazione
% method        = 1 soluzione eq. normali con LU
%               = 2 soluzione con QR
%               = 3 soluzione con backslash
%               = 4 polyfit/polyval (Attenzione, altra base polinomiale)
% OUTPUT-------------------------------------------------------------------
% peval         vettore colonna [Nx1] valutazione del pol su xeval
% coeff         coefficienti calcolati
%--------------------------------------------------------------------------

    switch method
        case 1
            A=xsample(:).^(deg:-1:0);
            Aeval=xsample(:).^(deg:-1:0);
            G = A * A';
            [L, U, P]=lu(G);
            c = U \ (L \ (P*(A' * ysample(:))));
            peval = Aeval * c;
        case 2
            A=xsample(:).^(deg:-1:0);
            Aeval=xsample(:).^(deg:-1:0);
            [Q0, R0]=qr(A, 0);
            c = R0 \ (Q0' * ysample(:));
            peval = Aeval * c;
        case 3
            A=xsample(:).^(deg:-1:0);
            Aeval=xsample(:).^(deg:-1:0);
            G = A' * A;
            c = G \ (A' * ysample(:));
            peval = Aeval * c;
        case 4
            c=polyfit(xsample, ysample, deg);
            peval=polyval(c, xeval)
    end
end

%%Recupero 2 Secondo Appello - Atto 2
clear all
close all
clc
warning off

f=@(x) 1./(1 + x.^2)
xeval=linspace(-1, 1, 10000)';
yeval=f(xeval);
nmin=1; nmax=50;
E1=[]; E2=E1; E3=E1; E4=E1;
for n=nmin:nmax
    xsample=linspace(-1, 1, n^2)';
    ysample=f(xsample);
    [peval1,coeff1]=MyFit(xsample,ysample,n,xeval,1);
    [peval2,coeff2]=MyFit(xsample,ysample,n,xeval,2);
    [peval3,coeff3]=MyFit(xsample,ysample,n,xeval,3);
    [peval4,coeff4]=MyFit(xsample,ysample,n,xeval,4);
    E1(n)=max(abs(yeval - peval1))
    E2(n)=max(abs(yeval - peval2))
    E3(n)=max(abs(yeval - peval3))
    E4(n)=max(abs(yeval - peval4)):
end
figure(1);
semilogy(E1);
hold on
semilogy(E2);
semilogy(E3);
semilogy(E4);
legend('LU', 'QR', 'Backslash', 'Polyfit/Polyval')
title('Errori di approssimazione dei quattro metodi')

%%Terzo appello - Atto 1
clear all
close all
clc
warning off

l=3; m=18;
teval=linspace(-1/2, 1/2);
res=[];
A=@(t) diag([t*ones(1, l); ones(m-l, 1)])+diag(ones(m-1,1),1)+diag(ones(m-1,1),-1);
b=[1; 2*ones(l-1, 1);3*ones(m-l-1, 1)];

[L U P]=lu(A(0));
if min(abs(diag(U))) == 0
    fprintf('La matrice A(0) e'' singolare perche'' la matrice U ha elementi diagonali nulli\n')
end
n=1:2:29;
for i=n 
    clf
    tsample=0.5*cos((0:n)./n*pi);
    for j=1:n+1
        [L U P]=lu(A(tsample(i)));
        xsample(:, i)=U\(L\(P*b));
    end
    for k=1:m 
        c=polyfit(tsample, xsample(k, :), n);
        xeval0(k,1)=polyval(coeff,0);
        for j=1:100
            xeval(k, j)=polyval(coeff, teval(j));
        end
    end
    plot(teval, xeval')
    title('Interpolazione a grado %d', i);
    pause(1)
    hold off
    res=[res norm(A(0)*xeval0-b)];
end
figure(2)
semilogy(nvalues,res)
title('residui vs grado')

%%Quarto appello - Atto 1
function [x, r, res] = MinNormLs(A, b, toll)
% HELP - MinNormLs
% Calcola la soluzione di norma minima delle equazioni normali ai
% minimi quadrati, il rango della matrice A e la norma del residuo
% delle equazioni normali
% INPUT--------------------------------------------------------------------
% A     [N X N] matrice             Matrice di input
% b     [1 x N] vettore riga        Termine noto
% toll  [1 x 1] scalare             Soglia di tolleranza
% OUTPUT-------------------------------------------------------------------
% x     [N x 1] vettore colonna     Soluzione di norma minima
% r     [1 x 1] scalare             Rango della matrice A
% res   norma                       Norma del residuo delle eq. normali
%--------------------------------------------------------------------------
    test = false;
    [Q R P] = qr(A');
    if test
        r = rank(A);
    else
        r = sum(abs(diag(R)) >= length(A) * toll);
    end

    R0 = R(1:r, :);
    Q0 = Q(:,1:r);
    S  = R0 * R0';
    
    if test
        y = S \ (R0 * b);
    else
        [L, U, P] = lu(S);
        y  = U\(L\(P * R0 * b));
    end
    x = Q0 * y;
    res = norm(A' * A * x - A' * b);
end

%%Quarto appello - Atto 2
clear all
close all
clc
warning off

toll=10^-9;
for n=3:30
    A0=hilb(n);
    A=[A0(1:end-1,:);sum(A0(1:end-1,:))];
    b=A*ones(n,1);

    K(n)=rcond(A);
    [x, r, res]=MinNormLs(A,b,toll);
    xls=lsqminnorm(A' * A,A  * b); 

    myres(n)=res;
    mynorm(n)=norm(x);

    matlabnorm(n)=norm(xls);
    matlabres(n)=norm(A' * A * xls - A' * b);    
end
figure(1)
plot(mynorm);
hold on
plot(matlabnorm,'--')
title("Norme");
legend("Norma MinNormLs", "Norma lsqminnorm");

figure(2)
semilogy(myres);
hold on
semilogy(matlabres,'--')
semilogy(K,'k')
title("Residui + Fattore di condizionamento");
legend("Reciproco condizionamento", "Residuo MinNormLs", "Residuo lsqmminnorm");

fprintf(1, "Il metodo non è stabile in quanto esso utilizza al suo interno operazioni non stabili di per sè");

%%Appello straordinario per Laureandi - Atto 1
function [cN,bN,R0]=MyPolyfit(f,a,b,n,N)
% HELP - MyPolyfit
% Calcola nodi e pesi di quadratura per l'intervallo [a, b]
% tramite la formula dei trapezi composta
% INPUT--------------------------------------------------------------------
% f     function handle             Funzione di valutazione
% a     [1 X 1] scalare             Estremo inferiore di integrazione
% b     [1 X 1] scalare             Estremo superiore di integrazione
% n     [1 X 1] scalare             Grado di valutazione
% N     [1 X 1] scalare             Numero di sottointervalli
% toll  [1 x 1] scalare             Soglia di tolleranza
% OUTPUT-------------------------------------------------------------------
% cN    [1 x N] vettore riga        Soluzione del sistema lineare
% bN    [1 x N] vettore riga        Termine noto 
% R0    [1 x N+1] vettore riga      Parte quadrata superiore del fattore R
%--------------------------------------------------------------------------

[x, w]=Trapezi(a, b, N-1);
V=x.^(0:n);
y=f(x);
bN=V' * diag(w) * y;
S = diag(w.^(1/2))*V;
[Q R] = qr(V);
R0 = R(1:n+1, :);
cN=SostituzioneIndietro(R0, SostituzioneAvanti(R0', bN));
end

%%Appello straordinario per Laureandi - Atto 2
clear all
close all
f=@(x) abs(x - 1/2);
a=-1; b=1; N=401;
degs=2:2:30;
xplot=linspace(a, b)';
yplot=f(xplot);
for n=degs
    [cN,bN,R0]=MyPolyfit(f,a,b,n,N);
    pplot=(xplot.^(0:n))*cN;
    figure(1);
    plot(xplot, yplot);
    hold on
    plot(xplot, pplot);
    pause(1)
end

%%Quinto appello - Atto 1
function yval=myfit(x,y,xval,n,method)
% HELP - myfit
% Calcola la valutazione del polinomio di migliore approssimazione
% sulle coppie di nodi di input nel senso dei minimi quadrati
% INPUT--------------------------------------------------------------------
% x     [m x 1] vettore colonna
% y     [m x 1] vettore colonna
% xval  [k X 1] scalare             Nodi di valutazione del polinomio
% n     [1 X 1] scalare             Grado di valutazione
% method =                          Stringa per decidere la valutazione
%                                   sul tipo della matrice
%       full - Valutazione su matrice sparsa (val. quasi tutti uguali a zero)
%       rectangular - Valutazione su matrice rettangolare
% OUTPUT-------------------------------------------------------------------
% yval [k x 1]  vettore colonna     Valutazione del polinomio sui nodi xval
%--------------------------------------------------------------------------
switch method
case 'full'
    G = A' * A;
    b = A' * y(:);
    [Q0, R0]=qr(G, 0);
    c=SostituzioneIndietro(R0, Q0', * Y(:));
    yval = Aeval * c;
case 'rectangular'
    A=x.^(0:n);
    Aeval=xeval.^(0:n);
    [Q, R]=qr(A);
    R0=R(1:n+1, :);
    Q0=Q(:, 1:n+1);
    c=SostituzioneIndietro(R0, Q0' * y(:));
    yval = Aeval * c;
end

%%Quinto appello - Atto 2
clear all
close all
clc
f=@(x) 1./(1+x.^2);
n=45;
xeval=linspace(-1,1,100)';
yeval=f(xeval);
yval_rect=myfit(x,y,xval,n,'rectangular');
yval_full=myfit(x,y,xval,n,'full');
err_abs_rect=max(abs(yval_rect - yeval));
err_abs_full=max(abs(yval_full - yeval));
fprintf('Il massimo errore compiuto con il metodo ''rectangular'' e'': %1.5d \n', err_rect);
fprintf('Il massimo errore compiuto con il metodo ''full'' e'': %1.5d \n', err_full);


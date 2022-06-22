clear all
close all

% dati globali
f=@(x) 1./(x.^2+1);
a=-5;b=5; % estremi intervallo
m=5001; % num punti valutazione
degs=2:10:102; % gradi polinomiali considerati
pausa=0.2;
%% corpo dell'esperimento
xeval=linspace(a,b,5001);
f_eval=f(xeval)';
E_equi=zeros(1,length(degs));
E_cheb=zeros(1,length(degs));
E_equi_matlab=zeros(1,length(degs));
E_cheb_matlab=zeros(1,length(degs));
E_rieval_equi=zeros(1,length(degs));
E_rieval_cheb=zeros(1,length(degs));
E_rieval_equi_matlab=zeros(1,length(degs));
E_rieval_cheb_matlab=zeros(1,length(degs));

i = 1;
for n=degs
    xinterp_equi=linspace(a,b,n+1);
    yinterp_equi=f(xinterp_equi)';
    
    xinterp_cheb=5*cos((2*(n:-1:0)+1)./(2*n+2)*pi); % pti di Chebyshev
    %xinterp_cheb=5*cos((n:-1:0)./n*pi); % pti di Gauss-Chebyshev
    yinterp_cheb=f(xinterp_cheb)';
    
    % Con Lagrange
    L_equi=LagrangePoly(xinterp_equi,xeval);
    L_cheb=LagrangePoly(xinterp_cheb,xeval);
    
    L_rieval_equi=LagrangePoly(xinterp_equi,xinterp_equi);
    L_rieval_cheb=LagrangePoly(xinterp_cheb,xinterp_cheb);
    
    yeval_equi=L_equi*yinterp_equi;
    yeval_cheb=L_cheb*yinterp_cheb;
    
    % Con polyfit-polyval (punto 2)
    c_equi=polyfit(xinterp_equi,yinterp_equi,n);
    c_cheb=polyfit(xinterp_cheb,yinterp_cheb,n);
    
    yeval_equi_matlab=polyval(c_equi,xeval);
    yeval_cheb_matlab=polyval(c_cheb,xeval);
    
    % punto 3
    yrieval_equi=L_rieval_equi*yinterp_equi;
    yrieval_cheb=L_rieval_cheb*yinterp_cheb;
    
    yrieval_equi_matlab=polyval(c_equi,xinterp_equi); %teoricamente = a yeval_..
    yrieval_cheb_matlab=polyval(c_cheb,xinterp_cheb);

    
    % errori su punti di valutazione
    E_equi(i)=max(abs(yeval_equi-f_eval));
    E_cheb(i)=max(abs(yeval_cheb-f_eval));
    E_equi_matlab(i)=max(abs(yeval_equi_matlab'-f_eval));
    E_cheb_matlab(i)=max(abs(yeval_cheb_matlab'-f_eval));

    % errori sui punti di interpolazione
    E_rieval_equi(i)=max(abs(yrieval_equi-yinterp_equi));
    E_rieval_cheb(i)=max(abs(yrieval_cheb-yinterp_cheb));
    E_rieval_equi_matlab(i)=max(abs(yrieval_equi_matlab'-yinterp_equi));
    E_rieval_cheb_matlab(i)=max(abs(yrieval_cheb_matlab'-yinterp_cheb));
    
    i = i+1;
end

%% grafico errori (punto 5)
figure(1);
% errori di valutazione
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
%errori di interpolazione
subplot(1,2,2);
semilogy(degs,E_rieval_equi,'r');
hold on
semilogy(degs,E_rieval_cheb,'g');
semilogy(degs,E_rieval_equi_matlab,'r--');
semilogy(degs,E_rieval_cheb_matlab,'g--');
legend('err interp equi Lagrange','err interp Cheb Lagrange',...
    'err interp equi matlab','err interp Cheb matlab');
title('errori sui punti di interpolazione')
%% stampa a video (punto 5)
A=[degs;E_equi;E_cheb;E_equi_matlab;E_cheb_matlab];

fprintf('Interpolazione della f. di Runge\n')
fprintf('-----------------------------------------------------\n')
fprintf(['Parametri: a=-5, b=5, ' num2str(m) ' punti di valutazione\n'])
fprintf('-----------------------------------------------------\n')
fprintf('Risultati:\n')
fprintf('|grado|\t |err interp equi   |\t |err interp cheb   |\t |err interp equi mat|\t |err interp cheb mat|\n')
fprintf('-----------------------------------------------------\n')
fprintf('|%5d|\t |%1.12e|\t |%1.12e|\t |%1.12e|\t |%1.12e| \n',A)

%% stampa su file (punto 6)
file = fopen("errori.txt","w");
fprintf(file,'Interpolazione della f. di Runge\n');
fprintf(file,'-----------------------------------------------------\n');
fprintf(file,['Parametri: a=-5, b=5, ' num2str(m) ' punti di valutazione\n']);
fprintf(file,'-----------------------------------------------------\n');
fprintf(file,'Risultati:\n');
fprintf(file,'|grado|\t |err interp equi   |\t |err interp cheb   |\n');
fprintf(file,'-----------------------------------------------------\n');
fprintf(file,'|%5d|\t |%1.12e|\t |%1.12e| \n',[degs;E_equi;E_cheb]);
fclose(file);

file = fopen('errorimatlab.txt','w');
fprintf(file,'Interpolazione della f. di Runge\n');
fprintf(file,'-----------------------------------------------------\n');
fprintf(file,['Parametri: a=-5, b=5, ' num2str(m) ' punti di valutazione\n']);
fprintf(file,'-----------------------------------------------------\n');
fprintf(file,'Risultati:\n');
fprintf(file,'|grado|\t |err interp equi   |\t |err interp cheb   |\n');
fprintf(file,'-----------------------------------------------------\n');
fprintf(file,'|%5d|\t |%1.12e|\t |%1.12e| \n',[degs;E_equi_matlab;E_cheb_matlab]);
fclose(file);

clc
close all
clear all
f=@(x) 1./(1+x.^2);
n=45;
x=linspace(-1,1,100)';
y=f(x);
xval=linspace(-1,1,1000)';
yval=f(xval);
yval_rect=myfit(x,y,xval,n,'rectangular');
yval_full=myfit(x,y,xval,n,'full');
err_rect=max(abs(yval_rect-yval));
err_full=max(abs(yval_full-yval));

fprintf('Il massimo errore compiuto con il metodo ''rectangular'' e'': %1.5d \n', err_rect);
fprintf('Il massimo errore compiuto con il metodo ''full'' e'': %1.5d \n', err_full);

% 21348 Greggio Marta
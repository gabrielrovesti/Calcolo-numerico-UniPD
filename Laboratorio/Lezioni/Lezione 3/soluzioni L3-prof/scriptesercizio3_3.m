close all
clear all

f=@(x) exp(1).^x.*(x.^2+1);
xplot=linspace(0,1);
fnumber=1;
PlotAsIWant(xplot,f,fnumber,'f'...
    ,'.-','solo_f_in_eps','eps');
fnumber=2;
PlotAsIWant(xplot,@g,fnumber,'g'...
    ,'.-','solo_g_in_eps','eps');
fnumber=3;
PlotAsIWant(xplot,f,fnumber,'f');
hold on
PlotAsIWant(xplot,@g,fnumber,'f e g'...
    ,'.-','f_e_g_in_eps','eps');
hold off
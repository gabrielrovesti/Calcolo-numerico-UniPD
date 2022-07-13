function [varargout]=myPlot(x, y, fig_name, fig_number, varargin)
% Help: myPlot
% Function di plot personalizzabile sulla base del numero di argomenti di
% input (intervallo, funzione, figura, dati figura, grafica e salvataggio)
% --------------------------------------------------------------------------
% INPUT
% x                double [1 x 1]	Ascisse di valutazione
% f                function handle
% fig_name         stringa          Nome della figura da creare
% fig_number	   intero [1 x 1]	Numero della figura da creare
% varargin         cell array		Insieme delle variabili di input 
%---------------------------------------------------------------------------
% OUTPUT
% varargout        cell array		Insieme delle variabili di output 
%----------------------------------------------------------------------------

myfig=figure(fig_number);
plot(x,y,'.');
switch nargin
    case 5
        mytitle=varargin{1};
        title(mytitle);
    case 6
        mytitle=varargin{1};   
        myxlabel=varargin{2};
        title(mytitle);
        xlabel(myxlabel);
    case 7
        mytitle=varargin{1};
        myxlabel=varargin{2};
        myylabel=varargin{3};
        title(mytitle);
        xlabel(myxlabel);
        ylabel(myylabel);
end
savefig(myfig,[fig_name '.fig'])
hgexport(myfig,[fig_name '.eps'])
if nargout==1
        varargout{1}=['Salvata figura ' num2str(fig_number) ' in ' fig_name '.fig' ' e in ' fig_name '.eps'];
end
close(myfig)

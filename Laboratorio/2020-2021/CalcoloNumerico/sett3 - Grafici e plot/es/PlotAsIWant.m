function [varargout]=PlotAsIWant(x, f, fig_number, varargin)
%PlotAsIWant    Produce un grafico di funzione con le specifiche indicate
%
%   Inputs:
%       x: vettore contenente i parametri nelle coordinate x
%       f: function handle da applicare a x
%       fig_number: numero della figura
%       title: titolo del grafico (opzionale)
%       specs: specifiche grafiche della figura (opzionale)
%       fig_name: nome della figura (opzionale)
%       save_opt: estensione per il salvataggio (opzionale)
%                 'f' per .fig,
%                 'e' per .eps,
%                 'fe' per entrambi
%       close_flag: flag per la chiusura della figura (opzionale)
%
%   Outputs:
%       message: messaggio di avviso

% Valori di default per i parametri opzionali
spec_graf = '-';
save_opt = 'f';
close_flag = 0;

myfig=figure(fig_number);
switch nargin
    case 4
        mytitle=varargin{1};
        title(mytitle) ;
    case 5
        mytitle = varargin{1};
        spec_graf = varargin{2};
        title(mytitle);
    case 6
        mytitle=varargin{1};
        spec_graf=varargin{2};
        fig_name=varargin{3};
        title(mytitle);
    case 7
        mytitle=varargin{1};
        spec_graf=varargin{2};
        fig_name=varargin{3};
        save_opt=varargin{4};
        title(mytitle);
    case 8
        mytitle=varargin{1};
        spec_graf=varargin{2};
        fig_name=varargin{3};
        save_opt=varargin{4};
        close_flag=varargin{5};
        title(mytitle);
end

plot(x, f(x),spec_graf);

if nargin >= 4
    switch save_opt
        case 'e'
            hgexport(myfig,[fig_name '.eps']);
        case 'fe'
            savefig(myfig,[fig_name '.fig']);
            hgexport(myfig,[fig_name '.eps']);            
        otherwise
            savefig(myfig,[fig_name '.fig']);
    end
end

if nargout == 1
    varargout{1}=['Salvata figura ' num2str(fig_number) ' in ' fig_name '.fig' ' e in ' fig_name '.eps'];
end

if close_flag
    close(myfig);
end

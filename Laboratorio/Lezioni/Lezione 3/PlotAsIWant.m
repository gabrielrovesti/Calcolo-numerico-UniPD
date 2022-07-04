function [varargout]=PlotAsIWant(x, f, fig_number, varargin)
myfig=figure(fig_number);

% Valori di default per i parametri opzionali
spec_graf = '-';
save_opt = 'f';
close_flag = 0;

%%Switch sugli argomenti opzionali, considerando
%%le varie casistiche di:
%%titolo figura, specifica figura per il plot
%%nome figura per il salvataggio, opzioni di salvataggio
%% e flag per la chiusura
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
%%plot preventivo
plot(x, f(x),spec_graf);

%%A seconda del n. di argomenti,
%%si implementa l'opzione di salvataggio,
%%ad esempio per .eps o per .fig
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
        option=input('Inserire opzione salvataggio: ', 's');        
        flag=input('Inserire il flag di chiusura della figura: ', 's');
        PlotAsIWant
end

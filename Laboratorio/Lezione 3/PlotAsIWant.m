clear all
function [out] = myPlot(x, fun, fig_name, varargin)
    %%Esempio di function handle da valutare e plottare su x
    myfig=figure(fig_number);
    %%A questo punto proviamo a prenderci i parametri opzionali
    switch nargin 
        case 4
            mytitle=varargin{1};
            title(myfig, mytitle);
        case 5
            mytitle=varargin{1};
            myline=varargin{2};
            title(myfig, mytitle);
            out=plot(fun(x), myline);
        case 6
        mytitle=varargin{1};
        myline=varargin{2};
        fig_name=varargin{3};
        title(myfig, mytitle);
        out=plot(fun(x), myline);
        savefig(myfig,[fig_name '.fig'])
        case 7
        mytitle=varargin{1};
        myline=varargin{2};
        fig_name=varargin{3};
        myoption=varargin{4};
        title(myfig, mytitle);
        out=plot(fun(x), myline);
        if ~isempty(fig_name)
            if myoption == "eps"
            disp("Salvato in formato .eps");
            savefig(myfig,[fig_name '.eps'])
            elseif myoption == "both"
                 disp("Salvato nei formati .fig e .eps");
                 savefig(myfig,[fig_name '.fig'])
                 savefig(myfig,[fig_name '.eps'])
            else
                 disp("Salvato in formato .fig");
                 savefig(myfig,[fig_name '.fig'])
            end
        end
        case 8
        mytitle=varargin{1};
        myline=varargin{2};
        fig_name=varargin{3};
        myoption=varargin{4};
        flag=varargin{5};
        title(myfig, mytitle);
        out=plot(fun(x), myline);
        if ~isempty(fig_name)
            if myoption == "eps"
            disp("Salvato in formato .eps");
            savefig(myfig,[fig_name '.eps'])
            hgexport(flag, 'filename.eps');
            elseif myoption == "both"
                 disp("Salvato nei formati .fig e .eps");
                 savefig(myfig,[fig_name '.fig'])
                 hgexport(flag, 'filename.fig');
                 savefig(myfig,[fig_name '.eps'])
                 hgexport(flag, 'filename.eps');
            else
                 disp("Salvato in formato .fig");
                 savefig(myfig,[fig_name '.fig'])
                 hgexport(flag, 'filename.fig');
            end
        end
    end
end


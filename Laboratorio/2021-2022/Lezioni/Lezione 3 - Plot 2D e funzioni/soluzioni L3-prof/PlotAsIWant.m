function []=PlotAsIWant(xplot,fhandle,fnumber,varargin)
n=nargin-3;
fig=figure(fnumber);
switch n
    case 0
        plot(xplot,fhandle(xplot));
    case 1
        plot(xplot,fhandle(xplot));
        mytitle=varargin{1};
        title(mytitle);
    case 2
        mygraphicsetting=varargin{2};
        plot(xplot,fhandle(xplot),...
            mygraphicsetting);
        mytitle=varargin{1};
        title(mytitle);
    case 3
        mygraphicsetting=varargin{2};
        plot(xplot,fhandle(xplot),...
            mygraphicsetting);
        mytitle=varargin{1};
        title(mytitle);
    case 4
        mygraphicsetting=varargin{2};
        plot(xplot,fhandle(xplot),...
            mygraphicsetting);
        mytitle=varargin{1};
        title(mytitle);
        myname=varargin{3};
        myfiletype=varargin{4};
        if myfiletype=='fig'
            savefig(fig,[myname,'.fig']);
        elseif myfiletype=='eps'
            hgexport(fig,myname);
        end
    case 5
        mygraphicsetting=varargin{2};
        plot(xplot,fhandle(xplot),...
            mygraphicsetting);
        mytitle=varargin{1};
        title(mytitle);
        myname=varargin{3};
        myfiletype=varargin{4};
        if myfiletype=='fig'
            savefig(fig,[myname,'.fig']);
        elseif myfiletype=='eps'
            hgexport(fig,[myname,',eps']);
        end
        if varargin{5}=='close'
            close(fig)
        end
end
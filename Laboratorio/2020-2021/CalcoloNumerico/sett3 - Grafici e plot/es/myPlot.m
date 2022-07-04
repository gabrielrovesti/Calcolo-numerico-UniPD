function [varargout]=myPlot (x, y, fig_name, fig_number, varargin)
myfig=figure(fig_number);
plot(x, y, '.');
switch nargin
case 5
    mytitle=varargin{1};
    title(mytitle) ;
case 6
    mytitle = varargin{1};
    myxlabel = varargin{2};
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

savefig(myfig,[fig_name '.fig']);
hgexport(myfig,[fig_name '.eps']);

if nargout == 1
    varargout{1}=['Salvata figura ' num2str(fig_number) ' in ' ig_name '.fig' ' e in ' fig_name '.eps'];
end
close(fig);
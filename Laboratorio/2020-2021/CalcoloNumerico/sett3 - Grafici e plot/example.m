function [varargout] = example(varargin)

if nargin > 0
    if nargin > 2
        display("parametri ignorati");
    end
    display(varargin{1});
    if nargin > 1
        display(varargin{2});
    end
end

if nargout == 1
    varargout{1} = "ok";
end

end


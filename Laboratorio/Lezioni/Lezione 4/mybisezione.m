function [out]=mybisezione(f,a,b,toll)
n=0;
    while(b - a) > toll
        x = (a + b)/2;
        if f(a)*f(x) < 0
            b = x;
        else
            a = x;
        n = n + 1;
        end
    end
end




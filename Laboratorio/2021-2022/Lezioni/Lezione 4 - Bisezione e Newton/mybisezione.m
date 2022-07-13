function x=mybisezione(f,a,b,toll)
    %% mybisezione : Versione semplificata dell’algoritmo di bisezione
    % ----------INPUT----------------------------------------------------------
    % f             function handle di una funzione continua da [a,b] in R
    % a             double [1 x 1] estr inf intervallo
    % b             double [1 x 1] sup intervallo
    % toll          double [1 x 1] tolleranza per criterio di arresto
    % ----------OUTPUT---------------------------------------------------------
    % x             double [1 x 1] ultima approssimazione della radice
    %--------------------------------------------------------------------------
    
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
    
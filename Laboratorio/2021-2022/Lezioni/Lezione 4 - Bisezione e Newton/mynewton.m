function [x, s]=mynewton(f,df,x0,toll,itmax)
    %% mynewton : Versione semplificata dell’algoritmo di Newton
    % ----------INPUT----------------------------------------------------------
    % f             function handle di una funzione C^2 da [a,b] in R
    % df            derivata della funzione della function handle df
    % x0            double [1 x 1] punto di partenza
    % toll          double [1 x 1] tolleranza per criterio di arresto
    % itmax         double [1 X 1] massimo numero di iterazioni
    % ----------OUTPUT---------------------------------------------------------
    % x             double [1 x 1] ultima approssimazione della radice
    % step          double [1 x N] iterate del metodo di Newton
    %--------------------------------------------------------------------------
    
x=x0; n=0; s=toll+1
    while abs(s) > toll && n < itmax
        if df == 0
            error("Errore");
        else
            s=f/df;
            x=x-s;
        end
        n=n+1;
    end
end
    
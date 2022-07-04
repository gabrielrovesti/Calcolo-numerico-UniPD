function n=mynewton(f,df,x0,toll,itmax)
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
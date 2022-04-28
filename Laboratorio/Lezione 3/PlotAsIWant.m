clear all
function [out] = myPlot(x, fun,fig_number,mytitle,myline,fig_name,option,flag)
    x=input("Inserire le ascisse: ");
    %%Esempio di function handle da valutare e plottare su x
    fun = @(x) x.^3 - 8*x.^2 + 10;
    %%Da capire come si dovrebbe prenderla in input...
    fig_number=input("Inserire il numero di figura dove produrre il grafico: ");
    myfig=figure(fig_number);
    %%A questo punto proviamo a prenderci i parametri opzionali
    mytitle=input("Inserire il titolo del plot: ");
    title(myfig, mytitle);
    
    myline=input("Inserire la linea al grafico: ")
    switch myline
        case '-'
        
        case '--'  

        case ':'

        case '-.'
        otherwise
            disp('Inserire altro valore: ');
    end
    %%Giusto per avere un'idea possibile di plot
    %%diversa comunque dalla richiesta dell'esercizio
    plot(x, fun(x))

end
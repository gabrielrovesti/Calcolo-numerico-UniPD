clear all
    x=input("Inserire le ascisse: ");
    fun = @(x) x.^3 - 8*x.^2 + 10;
    fig_number=input("Inserire il numero di figura dove produrre il grafico: ");
    nargs=input("Inserire il numero di argomenti di input:");
    switch nargs
        case 4
        mytitle=input('Inserire il titolo del plot: ', 's');
        PlotAsIWant
        case 5
        mytitle=input('Inserire il titolo del plot: ', 's');
        myline=input('Inserire la linea del grafico: ', 's');
        PlotAsIWant
        case 6
        mytitle=input("Inserire il titolo del plot: ");
        myline=input('Inserire la linea del grafico: ', 's');
        fig_name=input('Inserire nome figura per salvataggio: ', 's');
        PlotAsIWant
        case 7
        mytitle=input("Inserire il titolo del plot: ");
        myline=input('Inserire la linea del grafico: ', 's');
        fig_name=input('Inserire nome figura per salvataggio: ', 's');
        option=input('Inserire opzione salvataggio: ', 's');
        PlotAsIWant
        case 8
        mytitle=input("Inserire il titolo del plot: ");
        myline=input('Inserire la linea del grafico: ', 's');
        fig_name=input('Inserire nome figura per salvataggio: ', 's');
        option=input('Inserire opzione salvataggio: ', 's');        
        flag=input('Inserire il flag di chiusura della figura: ', 's');
        PlotAsIWant
    end

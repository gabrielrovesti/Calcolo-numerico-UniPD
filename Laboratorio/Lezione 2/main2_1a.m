clear all;
%%Pulisco lo script e vado agli input classici
a = input("Inserisci a: ");
b = input("Inserisci b: ");
c = input("Inserisci c: ");
x1_vera = input("Inserisci x1 vera: ");
x2_vera = input("Inserisci x2 vera: ");
if(a ~= 0 && b ~= 0 && c ~= 0)
    eq2gr;  %%Richiamo normalmente lo script
    rel1 = abs(x1_vera - x1) / abs(x1_vera);
    rel2 = abs(x2_vera - x2) / abs(x2_vera);
    %%Calcolo gli errori relativi, con stampa alla c
    fprintf("Errore relativo x1 = %d\n", rel1);
    fprintf("Errore relativo x2 = %d\n", rel2);
else
    error("Inseriti valori nulli");
end


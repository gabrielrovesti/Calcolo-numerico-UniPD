%%Giustamente qui non vado a mettere clear
%%altrimenti dallo script chiamante non prende le variabili

delta = b^2 - 4*a*c;
%%Calcolo il delta e poi confronto i tre classici casi
if(delta == 0)
    x1=-b/(2*a);
    x2=x1;
    fprintf("Le soluzioni sono uguali: x1=x2= %e\n", x1);
elseif(delta > 0)
    x1=(-b-sqrt(delta))/(2*a);
    x2=(-b+sqrt(delta))/(2*a);
    fprintf("Soluzione x1: %e\n", x1);
    fprintf("Soluzione x2: %e\n", x2);
else
    error("No soluzioni");
end
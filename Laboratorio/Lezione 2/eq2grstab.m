delta = b^2 - 4*a*c;
if(delta == 0)
    x1=-b/(2*a);
    x2=x1;
    fprintf("Le soluzioni sono uguali: x1=x2= %e\n", x1);
elseif(delta > 0)       %%Qua ci metto la modifica per la stabilità
    x1=(-b+abs(b)*sqrt(delta))/(2*a);
    x2=(c/a*x1)/(2*a);
    fprintf("Soluzione x1: %e\n", x1);
    fprintf("Soluzione x2: %e\n", x2);
else
    error("No soluzioni");
end
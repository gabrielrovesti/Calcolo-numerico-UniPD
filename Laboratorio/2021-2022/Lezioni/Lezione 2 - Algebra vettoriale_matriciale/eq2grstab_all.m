if a==0
    if b==0
        x1=NaN;
        x2=NaN
    else
        x1=-c/b;   
        x2=x1
        fprintf("Equazione di primo grado: %e\n", x1);
    end
else
    delta = b^2 - 4*a*c;
    if delta < 0
        x1=NaN;
        x2=NaN;
        fprintf("Non ci sono soluzioni reali.\n");
    elseif delta == 0
        x1=-b/(2*a);
        x2=x1;
        fprintf("Soluzioni uguali: %e\n", x1);
    else
        if b==0
            x1=sqrt(-c / a);
            x2=-sqrt(-c / a);
            fprintf("x1 = %e\n", x1);
            fprintf("x2 = %e\n", x2);
        else
            x1 = -((b + sign(b)*sqrt(delta)) / (2 * a));
            x2 = c/(a * x1);
            fprintf("x1 = %e\n", x1);
            fprintf("x2 = %e\n", x2);
        end
    end
end

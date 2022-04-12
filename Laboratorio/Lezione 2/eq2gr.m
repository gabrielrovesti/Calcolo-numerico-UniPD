format short;
clear all;

% Scrivere un algoritmo che risolva l'equazione di secondo grado a
% coefficienti reali ax^2+bx+c=0, trovandone, se esistono, le due
% radici reali
% OPERAZIONI INSTABILI
% VALORI NON NULLI

% Input da utente
a = input("Inserisci il coefficiente di secondo grado: ");
b = input("Inserisci il coefficiente di primo grado: ");
c = input("Inserisci il termine noto: ");

% Esegui i calcoli solo se tutti i valori non sono nulli
if(a ~= 0 && b ~= 0 && c ~= 0) 
    % Calcolo del delta
    delta = b^2 - 4*a*c;
    % Se delta == 0 le due soluzioni coincidono
    if(delta == 0)
        x = -b / (2 * a);
        fprintf("Due soluzioni reali coincidenti\n");
        fprintf("x1 = x2 = %e\n", x);
    % Se delta > 0 ci sono due soluzioni distinte
    elseif(delta > 0)
        x1 = (-b - sqrt(delta)) / (2 * a);
        x2 = (-b + sqrt(delta)) / (2 * a);
        fprintf("Due soluzioni reali distinte\n");
        fprintf("x1 = %e\n", x1);
        fprintf("x2 = %e\n", x2);
    % Se delta < 0 l'equazione è irrisolvibile
    else
        fprintf("Nessuna soluzione reale.");
    end
% Caso in cui almeno uno dei valori è nullo
else
    fprintf("Errore: il programma non accetta valori nulli.");
end
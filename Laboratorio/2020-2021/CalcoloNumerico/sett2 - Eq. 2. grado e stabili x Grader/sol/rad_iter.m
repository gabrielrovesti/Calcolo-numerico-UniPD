A=[1 10^-5 -2*10^-10 -2*10^-5 10^-5;
    -10^-7 1+10^-14 -10^-7 10^7 10^7;
    10^-10 -1 10^-10 10^-10 10^10];

% Aggiungo due colonne in più per contenere gli errori relativi da
% calcolare
A1 = [A,zeros(size(A,1),2)];

% Per ogni riga k
for k = 1 : size(A,1)
    % Fornisco i coefficienti e le x conosciute allo script
    a = A(k,1);
    b = A(k,2);
    c = A(k,3);
    
    [x1vera,x2vera] = sort([A(k,4),A(k,5)]);
    
    % eseguo lo script
    radicistabili
    
    % calcolo gli errori relativi
    err_rel_1 = abs((x1-x1vera)/x1vera);
    err_rel_2 = abs((x2-x2vera)/x2vera);
    
    % e li inserisco nell'array
    A1(k,6) = err_rel_1;
    A1(k,7) = err_rel_2;
end
A1
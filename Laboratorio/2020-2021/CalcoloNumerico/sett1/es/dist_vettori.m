% Si consideri una matrice m x n in cui ogni colonna rappresenta un vettore su
% uno spazio vettoriale di dimensione m.
%
%       [ x11,x12,...,x1n;
%         x21,x22,...,x2n;
%         ...
%         xm1,xm2,..., xmn]
%
% Si calcoli la distanza massima per ogni coppia di vettori e fornire,
% stampando a schermo, i rispettivi indici
% Ricordate: la distanza tra due vettori u e v è data dalla norma di (u-v) 
%            oppure dalla radice quadrata di sum((u_i - v_i)^2) 
%            per ogni 1 < i < m.
% Suggerimento: potrebbero servirvi le funzioni sqrt, norm, vecnorm

matrice = [ 1 2 3 4 5 6;
            1 0 1 2 3 4;
            5 3 4 1 7 6 ];

max_distance = -1;
vettore_1 = 0;
vettore_2 = 0;

for i = 1 : length(matrice)
    for j = i + 1 : length(matrice)
        u = matrice(1:end,i);
        v = matrice(1:end,j);
        dist = norm(u-v);

        if dist > max_distance
            max_distance = dist;
            vettore_1 = i;
            vettore_2 = j
        end
    end
end


fprintf('Distanza massima:\t%3.4f\n',max_distance);
fprintf('Indici:\t\t\t(%2f,%2f)\n',vettore_1,vettore_2);
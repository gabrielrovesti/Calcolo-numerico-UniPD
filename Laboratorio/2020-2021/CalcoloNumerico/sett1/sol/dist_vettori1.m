clear;

vettori = [...
    1 2 3 4 5 1 0;... 
    2 0 1 3 4 1 0;...
    1 2 3 2 1 1 0;...
    3 4 5 6 1 1 0];

maxdist = 0;
vettore1 = 0;
vettore2 = 0;

for i = 1 : length(vettori)
    for j = i+1 : length(vettori)
       dist = norm((vettori(1:end,i) - vettori(1:end,j)));
       if dist > maxdist
           maxdist = dist;
           vettore1 = i;
           vettore2 = j;
       end
    end
end

fprintf('Distanza massima:\t%3.4f\n',maxdist);
fprintf('Indici:\t\t\t(%2f,%2f)\n',vettore1,vettore2);
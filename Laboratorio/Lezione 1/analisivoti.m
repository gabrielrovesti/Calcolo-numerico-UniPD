clear analisivoti
crediti=[6 6 9 9 6];
voti=[22 25 27 22 19];
tot_crediti=sum(crediti);

media_pesata=sum(crediti.*voti)/tot_crediti;
fprintf('La media pesata è %2.3f\n', media_pesata);
mediana=median(voti);
fprintf('La mediana è: %2.3f\n', mediana);
maximum=max(voti);
fprintf('Il massimo è: %2.3f\n', maximum);
minimum=min(voti);
fprintf('Il minimo è: %2.3f\n', minimum);
media=mean(voti);
fprintf('La media è: %2.3f\n', media);


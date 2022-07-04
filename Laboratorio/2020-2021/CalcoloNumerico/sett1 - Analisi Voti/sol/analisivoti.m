clear;

crediti = [6 9 9 12 6];
voti = [25 28 29 24 28];

tot_crediti = sum(crediti);

mediana = sort(voti);
mediana = mediana(ceil(length(voti)/2));
fprintf('Mediana:\t %2.0f\n',mediana);

media = sum(voti)/length(voti);
fprintf('Media:\t\t %2.3f\n',media);

media_pesata = sum(voti.*crediti)/tot_crediti;
fprintf('Media pesata:\t %2.3f\n',media_pesata);

voto_massimo = max(voti);
fprintf('Voto massimo:\t %2.0f\n',voto_massimo);

voto_minimo = min(voti);
fprintf('Voto massimo:\t %2.0f\n',voto_minimo);

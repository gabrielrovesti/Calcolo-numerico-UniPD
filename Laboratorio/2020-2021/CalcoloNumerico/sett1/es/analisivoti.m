clear;

crediti = [6 9 9 12 6 7];
voti = [25 28 29 24 28 29];

% calcola il massimo dei crediti
tot_crediti = sum(crediti);

% calcola e stampa la mediana
% mediana = (max(voti) + min(voti)) / 2;
% fprintf('la mediana è %2.3f\n', mediana);
mediana = sort(voti);
mediana = mediana(ceil(length(voti)/2));
fprintf('Mediana:\t %2.0f\n',mediana);

% calcola e stampa la media
media_aritmetica=sum(voti)/size(voti,2);

% calcola e stampa la media pesata
media_pesata1 = dot(voti, crediti) / sum(crediti)

% calcola e stampa il voto massimo
voto_max = max(voti)

% calcola e stampa il voto minimo
voto_min = min(voti)
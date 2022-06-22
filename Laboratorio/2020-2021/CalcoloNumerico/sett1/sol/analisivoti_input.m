clear;

n_voti = input('Quanti esami hai superato? ');
voti = zeros(n_voti,1);
crediti = zeros(n_voti,1);

for e = 1 : n_voti
    fprintf('Esame %2.0f\n',e);
    voti(e) = input('Che voto hai preso? ');
    crediti(e) = input('Quanti crediti valeva? ');
end
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

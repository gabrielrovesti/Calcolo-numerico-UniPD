clear;

n_voti = input('Quanti esami hai superato? ');
voti = zeros(n_voti,1);
crediti = zeros(n_voti,1);

for e = 1 : n_voti
    fprintf('Esame %2.0f\n',e);
    voti(e) = input('Che voto hai preso? ');
    crediti(e) = input('Quanti crediti valeva? ');
end

[mediana,media,media_pesata,voto_massimo,voto_minimo] = stud_stats(voti,crediti,n_voti);
fprintf(['Mediana:\t %2.0f\n'...
         'Media:\t\t %2.3f\n'...
         'Media pesata:\t %2.3f\n'...
         'Voto massimo:\t %2.0f\n'...
         'Voto massimo:\t %2.0f\n'],...
         mediana,media,media_pesata,voto_massimo,voto_minimo);

function [mediana,media,media_pesata,voto_massimo,voto_minimo] = stud_stats(voti,crediti,n_voti)
    tot_crediti = sum(crediti);

    mediana = sort(voti);
    mediana = mediana(ceil(n_voti/2));
    
    media = sum(voti)/length(voti);
    
    media_pesata = sum(voti.*crediti)/tot_crediti;
    
    voto_massimo = max(voti);
    
    voto_minimo = min(voti);
end


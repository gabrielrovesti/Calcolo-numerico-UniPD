function s = SuccessioneRicorsiva(s0,f,itmax)
%SuccessioneRicorsiva   Una funzione che, dati dei valori iniziali, calcola
%                       i valori della successione di una data funzione
%   INPUT:
%   s0 :    vettore dei valori iniziali della successione
%   f  :    function handler della funzione di cui calcolare la successione
%   itmax:  numero massimo di iterazioni da calcolare
%
%   OUTPUT:
%   s :     vettore con i valori della successione

s = [s0(:)',zeros(1,itmax)];

for n = length(s0) : itmax+1
     s(n+1) = f(s(1:n));
end

end


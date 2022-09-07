% il buon matlab giustamente segnala che ciò è spesso inutile e causa
% un calo delle performance, ma il prof lo usa lo stesso ¯\(°_o)/¯
% clear all;
close all;
clc;

% prealloco il vettore
invs = zeros(1, 10);

for n = 2:2:20
    H = hilb(n);
    Hinv = myInv(H);
    k = norm(H) * norm(Hinv);
    invs(n/2) = k;
end

semilogy(invs);
title("Indice di condizionamento di hilb(n) al variare di n");
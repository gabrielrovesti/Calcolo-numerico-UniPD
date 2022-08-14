% Script per il test della correttezza di nodi e pesi (NON MODIFICARE)
clear all
load X
load W
a=1;b=pi;
nmax=20;
for n=1:nmax
    [x,w]=FormulaEquispaziata(a,b,n);
    if max(norm(X{n}-x),norm(W{n}-w))
        error('I nodi e/o i pesi a grado %d sono errati\n',n)
    end
end
fprintf('I nodi e i pesi sono calcolati correttamente\n')
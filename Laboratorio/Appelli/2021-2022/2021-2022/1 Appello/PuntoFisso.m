function [pfisso,iterates,flag]=PuntoFisso(g,x0,toll,itmax)
% ----------INPUT----------------------------------------------------------
% g             function handle
% x0            double [1 x 1] punto di partenza
% toll          double [1 x 1] tolleranza per criterio di arresto
% itmax         double [1 X 1] massimo numero di iterazioni
%
% ----------OUTPUT---------------------------------------------------------
% pfisso        double [1 x 1] ultima approssimazione del punto fisso
% iterates      double [1 x N] iterate del metodo di punto fisso:
% flag          char [1 x 1] stato:
%                       flag = 's' uscita per test dello scarto
%                       flag = 'e' raggiunto il massimo numero di
%                                  iterazioni
%-----------FUNCTION BODY--------------------------------------------------

iterates=x0; % le iterate sono uguali al valore iniziale (x0)
it=0;
step=toll+1; % lo step è pari alla tolleranza+1, tale che possa fermarsi il while dopo
flag='s'; % flag per uscita criterio dello scarto
while it < itmax && step > toll
    it=it+1;
    if it == itmax % se abbiamo raggiunto le iterazioni massime, usciamo dal ciclo
        flag='e';
    end
% le iterate (essendo il punto fisso una contrazione, cioè si valuta “su sé stesso”)
% allora si concatena ad iterates il pezzo di g valutato in x0 fino alla fine,
% che è il punto di interesse
    iterates=[iterates,g(iterates(end))]; 
% lo step è dato come al solito dall’ultima approssimazione sulle iterate
    step=abs(iterates(end)-iterates(end-1));
end
pfisso=iterates(end); % l’ultima approssimazione del punto fisso è dato dalle iterate


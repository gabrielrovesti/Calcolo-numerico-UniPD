
function [pfisso,x,flag]=PuntoFisso(g,x0,toll,maxit)
% ----------INPUT----------------------------------------------------------
% g             Function handle
% x0            double [1 x 1] Punto di partenza
% toll          double [1 x 1] Tolleranza per criterio di arresto
% itmax         double [1 X 1] Massimo numero di iterazioni
% ----------OUTPUT---------------------------------------------------------
% pfisso        double [1 x 1] Ultima approssimazione del punto fisso
% iterates      double [1 x N] Iterate del metodo di punto fisso
% flag          int [1 x 1] Stato:
%                       flag = 1 Raggiunto il massimo numero di
%                                  iterazioni o raggiunta la tolleranza
%                       flag = 0 Tolleranza non raggiunta oppure
%					   il numero di iterazioni è minore del max
%-----------FUNCTION BODY--------------------------------------------------

x=x0; % Può essere pure: [x0, g(x0)]L
% x contiene tutte le approssimazioni compreso x0 e contatore it posto a 0
it=0; 
step=toll+1; % Lo step è pari alla tolleranza+1, tale che possa fermarsi il while dopo
flag=0; % Flag per uscita criterio dello scarto

% A quanto pare, la condizione può essere pure:
% abs(x(it) - x(it-1)) al posto di norm(step)
% e nel ciclo non viene poi calcolato lo step
while it <= maxit && norm(step) > toll
    it=it+1;
% Le iterate (essendo il punto fisso una contrazione, cioè si valuta “su sé stesso”)
% allora si concatena alle iterate (x) il pezzo di g valutato in x0 su sé stesso,
% per tutte le iterazioni possibili
    x=[x,g(x(end))]; % Similmente con x(it+1) = g(x(it));
% Lo step è dato come al solito dall’ultima approssimazione sulle iterate
    step=abs(x(end)-x(end-1)); % Similmente con step = abs(x(it+1) - x(it));
end
if norm(step) <= toll % Se la tolleranza ha superato lo step, allora flag vale 1
    flag=1;
end
pfisso=x(end); % L’ultima approssimazione del punto fisso è dato dalle iterate

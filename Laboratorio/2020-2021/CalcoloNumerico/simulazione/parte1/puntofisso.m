function [pfisso,iterates,flag]=puntofisso(g,x0,toll,itmax)
% ----------INPUT----------------------------------------------------------
% g             function handle
% x0            double [1 x 1] punto di partenza
% toll          double [1 x 1] tolleranza per criterio di arresto
% itmax         double [1 X 1] massimo numero di iterazioni
%
% ----------OUTPUT---------------------------------------------------------
% pfisso        double [1 x 1] ultima approssimazione del punto fisso
% iterates      double [1 x N] iterate del metodo dipunto fisso:
% flag          char [1 x 1] stato:
%                       flag = 's' uscita per test dello scarto
%                       flag = 'e' raggiunto il massimo numero di
%                                  iterazioni
%-----------FUNCTION BODY--------------------------------------------------

iterates=x0;
it=0;
step=toll+1;
flag='s';
while it<itmax && step>toll
    it=it+1;
    if it==itmax
        flag='e';
    end
    iterates=[iterates,g(iterates(end))];
    step=abs(iterates(end)-iterates(end-1));
end
pfisso=iterates(end);

function [zero, x]=Secanti(f, x0, x1, toll, maxit)
% ----------INPUT----------------------------------------------------------
% f             Function handle di classe 2 cont. e deriv.
% x0            double [1 x 1] Punto di partenza
% x1            double [1 x 1] Prima iterata
% toll          double [1 x 1] Tolleranza per criterio di arresto
% maxit         double [1 X 1] Massimo numero di iterazioni
% ----------OUTPUT---------------------------------------------------------
% zero          double [1 x 1] Ultima approssimazione della radice
% x             double [1 x N] Iterate del metodo delle secanti
%-----------FUNCTION BODY--------------------------------------------------

it=1;
step=abs(x1-x0);
x=[x0,x1];	       % I primi due punti dell’approssimazione nelle secanti sono x0 e x1
while it < maxit && norm(step) > toll	% Condizioni di stop del ciclo del testo
    % Il calcolo della successione di x riprende la slide come si vede sopra
    x_next = x(end) - (f(x(end)) .* (x(end) - x(end-1)) ./ (f(x(end)) - f(x(end-1))));
    % Il vettore x accoda tutte le approssimazioni ottenute
    x=[x, x_next];	
    % step viene aggiornato con l’ultima approssimazione del vettore x
    step = [step, abs(x(end) - x(end-1))];
    it=it+1;
end
zero=x(end); 	
end

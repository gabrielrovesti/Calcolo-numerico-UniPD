%MyQuad: funzione che calcola l'ultima
%approssimazione integrale della successione
%di approssimazioni nel caso di tolleranza raggiunta
function [int,I,step,flag]=MyQuad(a,b,f,formula,toll,maxN)
   N=1;
   flag=0;
   [x,w]=formula(a,b,N);
   I=w*f(x);

   %step affinché vada oltre la tolleranza
   step = toll+1;
   %dato che raddoppiamo, dobbiamo
   %fermarci alla metà di iterazioni possibili
   while step > toll && N < maxN/2
        N=N*2;
        [x,w]=formula(a,b,N);
        %salvo dentro I direttamente
        %la successione dei valori
        %calcolabili
        I=[I,w*f(x)];
        %mi interessa fermarmi all'ultima approssimazion
        %meno il passo n-1
        step=abs(I(end) - I(end-1));
   end
   %mi salvo la successione per restituirla
   int=I(end);
   %se non abbiamo raggiunto la tolleranza, fermo
   if abs(step) < toll
          flag=1;
   end
    
end

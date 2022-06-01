function A1=myInv(A)
    %Inizializzo l'inversa
    A1=zeros(size(A));
    %Calcolo la fattorizzazione LU
    [L,U,P]=lu(A);
    %Inizializzo una matrice identità nxn
    %con la dimensione di A
    I=eye(size(A));
    %Imposto un ciclo che parte da 1
    %e arriva fino alla size di A
    %incrementando di 1
    for i=1:size(A,1)
        %Risolvo le eq. lineari
        %applicando la sost. in avanti
        %a P moltiplicata per l'inversa
        x=SostituzioneAvanti(L,P*I(:,i));
        %Salvo tutto in A1
        A1=SostituzioneIndietro(U,x); 
    end
end
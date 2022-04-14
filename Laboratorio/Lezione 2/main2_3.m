clear all;
a = input("Inserisci a: ");
b = input("Inserisci b: ");
c = input("Inserisci c: ");
x1_vera = input("Inserisci x1 vera: ");
x2_vera = input("Inserisci x2 vera: ");

eq2grstab_all
rel1=abs(x1_vera - x1)/abs(x1_vera);
rel2=abs(x2_vera - x2)/abs(x2_vera);

%Creazione delle tabelle
A = [x1; rel1];
B = [x2; rel2];

%Scrittura su file con 
%successiva formattazione delle colonne
fileID = fopen('output2_3.txt','w');
fprintf(fileID,'%6s %12s\n','x1','Errore relativo x1');
fprintf(fileID,'%6.2f %12.8f\n',A);
fprintf(fileID,'%6s %12s\n','x2','Errore relativo x2');
fprintf(fileID,'%6.2f %12.8f\n',B);
fclose(fileID);



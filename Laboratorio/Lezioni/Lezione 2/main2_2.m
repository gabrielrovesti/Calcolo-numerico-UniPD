clear all;
a = input("Inserisci a: ");
b = input("Inserisci b: ");
c = input("Inserisci c: ");
x1_vera = input("Inserisci x1 vera: ");
x2_vera = input("Inserisci x2 vera: ");

eq2grstab_all

rel1=abs(x1_vera - x1)/abs(x1_vera);
rel2=abs(x2_vera - x2)/abs(x2_vera);
fprintf("Errore relativo x1: %d\n", rel1);
fprintf("Errore relativo x1: %d\n", rel2);


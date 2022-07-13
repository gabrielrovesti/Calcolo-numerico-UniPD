clear analisivoti_input

limite=input('Inserisci il limite dei vettori=');
n=1;
crediti=zeros(1, limite);
voti=zeros(1, limite);
while n<=limite
  crediti(n)=input('Inserisci i crediti: ');
  voti(n)=input('Inserisci il voto: ');
  n=n+1;
end
disp(crediti);
disp(voti);
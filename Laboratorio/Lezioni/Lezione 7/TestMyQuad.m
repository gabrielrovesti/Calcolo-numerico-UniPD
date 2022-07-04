% test della quadratura con raffinamento.
% Richiede :
% MyQuadrature, Trapezi, Parabole


clear all
clc
alpha=1.6;
f=@(x)abs(x).^alpha;
a=-sqrt(2);b=1;
intvero=1/(alpha+1)*(b^(alpha+1)+(-a)^(alpha+1));
toll=10^-6;
maxN=1024;
[integralet,It,stept,flagt]=MyQuad(a,b,f,@Trapezi,toll,maxN);
Ntrap=2^(length(It)-1);
Npuntit=Ntrap+1;
Errt=abs(intvero-integralet);
[integralep,Ip,stepp,flagp]=MyQuad(a,b,f,@Parabole,toll,maxN/2);
NPara=2^(length(Ip)-1);
Npuntip=2*NPara+1;
Errp=abs(intvero-integralep);
ris=[[Ntrap;NPara],[Npuntit;Npuntip],[integralet;integralep],[Errt;Errp]];
fprintf('Quadratura con trapezi e parabole\n')
if flagt==1
    fprintf('trapezi ha raggiunto la tolleranza\n')
else
    fprintf('trapezi non ha raggiunto la tolleranza\n')
end
if flagp==1
    fprintf('parabole ha raggiunto la tolleranza\n')
else
    fprintf('parabole non ha raggiunto la tolleranza\n')
end
fprintf('intervalli\t punti\t      integrale\t\t errore\n' )
fprintf('%d\t%d\t%15.12f\t%15.12e\n',ris');

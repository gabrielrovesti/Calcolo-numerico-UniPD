clear Esercizio_1
x=linspace(0,1); %100 è già implicito
f=@(x) exp(x).*(x.^2+1);

savefig(f,'10.fig','compact');

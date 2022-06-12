A=[1 10^-5 -2*10^-10 -2*10^-5 10^-5;
    -10^-7 1+10^-14 -10^-7 10^7 10^7;
    10^-10 -1 10^-10 10^-10 10^10];
A1=[A,zeros(3,2)];
for k=1:size(A,1)
    a=A(k,1);b=A(k,2);c=A(k,3);x1vera=A(k,4);x2vera=A(k,5);
    radicistabili
    err_rel_1=abs((x1-x1vera)/x1vera);
    err_rel_2=abs((x2-x2vera)/x2vera);
    A1(k,6)=err_rel_1;
    A1(k,7)=err_rel_2;
end
A1

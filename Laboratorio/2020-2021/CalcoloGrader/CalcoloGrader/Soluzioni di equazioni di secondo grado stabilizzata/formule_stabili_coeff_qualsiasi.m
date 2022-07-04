load mydata
if a == 0
    if b == 0
        y1=NaN; y2=NaN;
        fprintf('Error')
    else
        y1 = -c/b;
        y2=y1;
    end
else
    delta=b^2-4*a*c;
    if delta<0
        y1=NaN; y2=NaN; 
        fprintf('Error')
    elseif delta==0
        y1= -b/(2*a);
        y2=y1;
    else
        if b == 0
            y1=-sqrt(-c/a);y2=-y1;
        else
            y1=-(b+sign(b)*sqrt(delta))/(2*a);y2=c/(a*y1);
        end
    end
end
Y=[y1,y2];
X=sort(Y);
x1=X(1);x2=X(2);
fprintf('x1 vale %5.5f\n',x1)
fprintf('x2 vale %5.5f\n',x2)
if and(not(isnan(x1)),not(isnan(x2)))
    err_rel_1=abs((x1-x1vera)/x1vera);
    err_rel_2=abs((x2-x2vera)/x2vera);
    fprintf('err_rel_1 vale %3.15e\n',err_rel_1)
    fprintf('err_rel_2 vale %3.15e\n',err_rel_2)
else
    fprintf('Error \n')
end

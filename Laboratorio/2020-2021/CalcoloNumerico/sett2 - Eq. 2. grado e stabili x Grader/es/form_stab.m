if a == 0
    if b == 0
        x1 = NaN; 
        x2 = NaN;
        fprintf('Error \n')
    else
        x1 = -c/b;
        x2 = x1;
        fprintf('x1 = %3.5f \n',x1);
    end
else
    delta = b^2 - 4*a*c;
    if delta < 0
        x1 = NaN; 
        x2 = NaN; 
        fprintf('Error \n')
    elseif delta == 0
        x1 = -b/(2a);
        x2 = x1; 
        fprintf('x1 = %3.5f \tx2 = %3.5f \n',x1,x2);
    else % delta > 0
        if b == 0
            x1 = -sqrt(-c/a);
            x2 = -x1;
            Output video con fprintf
        else
            x1 = - ( b + sign(b) * sqrt(delta))/(2*a);
            x2 = c/(a*x1)
            Output video con fprintf
        end
    end
end

X = [min(x1,x2),max(x1,x2)]

if  and(not(isnan(X(1)), not(isnan(X(2)))))
    err_rel_1 = abs((X(1) - x1vera)/x1vera)    
    err_rel_2 = abs(X(2) - x2vera)/abs(x2vera)
    fprintf
else
    fprintf
end

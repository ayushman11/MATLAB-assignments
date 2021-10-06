function x = gauss_siedel(A,b)
sz= length(b);
Xo= zeros(sz,1);
X1= zeros(sz,1);

iter=1e4;

while(iter)
    for i=1:sz
        temp_sum=0;
        for j=1:i-1
            temp_sum = temp_sum + A(i,j).*X1(j);
        end    
        for j=i+1:sz
            temp_sum = temp_sum + A(i,j).*Xo(j);
        end
        X1(i)= (b(i) - temp_sum)./A(i,i);
    end
    max_err=0;
    for k=1:sz
       temp_err= abs((X1(k)-Xo(k))./X1(k));
       if(temp_err > max_err) % Checking max error
           max_err= temp_err;
       end
    end
    if(max_err < 1e-8)
       x=X1;
       return;
    end
    Xo= X1;
   iter=iter-1;
end
x= NaN;
disp('Did not converge');
end
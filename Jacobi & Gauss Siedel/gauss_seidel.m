function x= gauss_seidel(A, b)

x0= zeros(size(A,1),1);
sz=size(x0,1); 
x1=x0;
iter=1e6;
op=0;

% Pivoting
for i=1:sz
    diagonal_max=A(i,:);
    max_row=i;
    for k= i+1 : sz
        if(abs(A(k,i)) > abs(diagonal_max(i))) % Condition
            diagonal_max=A(k,:);
            max_row=k;
        end
    end

    A(max_row,:)=A(i,:); % Updating pivot row to max in column
    A(i,:)=diagonal_max;
    temp=b(i);
    b(i)=b(max_row); % Updating pivot row for b vector
    b(max_row)=temp;
end

% Gauss Seidel Method
while (iter)
    iter=iter-1;
    for i=1:sz
        temp_sum=0;
        for j=1:i-1
                temp_sum=temp_sum + A(i,j).*x1(j); % Taking sum of new values
        end
        for j=i+1:sz
                temp_sum=temp_sum + A(i,j).*x0(j); % Taking sum of old values
        end
        op= op + 2.*(sz-1);
        x1(i)=(b(i) - temp_sum)./A(i,i); % Gauss Seidel Formula
        op= op + 1;
    end 
    max_err=0;
    for k=1:sz
       temp_err= abs((x1(k)-x0(k))./x1(k));
       if(temp_err > max_err) % Checking max error
           max_err= temp_err;
       end
    end
    if(max_err < 1e-11) % Convergence condition
       x=x1;
       fprintf('No. of operations: %i\n',op);
       return;
    end
    x0= x1; % Replacing old values with new values
end
disp('Did not converge\n');
fprintf('No. of operations: %i\n',op);
end
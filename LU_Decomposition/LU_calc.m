function [L, U, counter]= LU_calc(A)
% Length of various matrices
size_A= size(A,1);
L= eye(size_A); % Initialized as identity matrix
counter=0;
for i= 1 : size_A
    % Pivot and largest diagonal element Condition
    diagonal_max=A(i,:);
    max_row=i;
    for k= i+1 : size_A
        if(abs(A(k,i)) > diagonal_max(i)) % Condition
            diagonal_max=A(k,:);
            max_row=k;
        end
    end
    A(max_row,:)=A(i,:); % Updating pivot value to max in column
    A(i,:)=diagonal_max;
    
    % Gauss-elimination method
    if abs(A(i,i)) > 1e-4 % Condition to ensure no operation is done on NULL element
        for j=i+1 : size_A
            factor= A(j,i)./A(i,i); % calculating factor
            counter= counter+1;
            L(j,i)= factor; % Updating L matrix
            A(j,:)=A(j,:)-factor.*A(i,:); % updating subsequent rows
            counter= counter+ 2.*(size_A -i +1);

        end
    end
end
U= A; % Modified A matrix is subsequently the required U matrix
end
    

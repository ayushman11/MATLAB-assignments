function [b0,b1,b2]= polynomial_regression_model(x,y)
    % XA = Y
    n = length(x);
    X = zeros(n,3);
    
    X(:,1)= 1;
    X(:,2)= x;
    X(:,3)= x.^2;
    
    Y= y';
    
    % X'XA = X'Y
    X_trans= X';

    % A = inv(X'X)X'Y
    A = inv(X_trans*X)*X_trans*Y;
    b0 = A(1); 
    b1 = A(2); 
    b2= A(3); 
end
function [a0,a1]= linear_regression_model(x,y)
    % XA = Y
    n = length(x);
    X = zeros(n,2);
    
    X(:,1)= 1;
    X(:,2)= x;
    
    Y= y';
    
    % X'XA = X'Y
    X_trans= X';
    
    % A = inv(X'X)X'Y
    A = inv(X_trans*X)*X_trans*Y;
    a0 = A(1);
    a1 = A(2);
end
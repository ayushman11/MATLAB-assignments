function [b1,b2]= polynomial_no_intercept(x,y)
    % XA = Y
    n = length(x);
    X = zeros(n,2);
    
    X(:,1)= x;
    X(:,2)= x.^2;
    
    Y= y';
    
    % X'XA = X'Y
    X_trans= X';
    
    % A = inv(X'X)X'Y
    A = inv(X_trans*X)*X_trans*Y;
    b1 = A(1)
    b2 = A(2)
end
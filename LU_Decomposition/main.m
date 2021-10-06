clear all;
clc

% Finding the inverse of matrix A using LU Decomposition

% A= [9 -4 1 0 0 0 0 0 0 0 0 0 0 0 0
%    -4 6 -4 1 0 0 0 0 0 0 0 0 0 0 0
%    1 -4 6 -4 1 0 0 0 0 0 0 0 0 0 0
%    0 1 -4 6 -4 1 0 0 0 0 0 0 0 0 0
%    0 0 1 -4 6 -4 1 0 0 0 0 0 0 0 0
%    0 0 0 1 -4 6 -4 1 0 0 0 0 0 0 0
%    0 0 0 0 1 -4 6 -4 1 0 0 0 0 0 0
%    0 0 0 0 0 1 -4 6 -4 1 0 0 0 0 0
%    0 0 0 0 0 0 1 -4 6 -4 1 0 0 0 0
%    0 0 0 0 0 0 0 1 -4 6 -4 1 0 0 0
%    0 0 0 0 0 0 0 0 1 -4 6 -4 1 0 0
%    0 0 0 0 0 0 0 0 0 1 -4 6 -4 1 0
%    0 0 0 0 0 0 0 0 0 0 1 -4 6 -4 1
%    0 0 0 0 0 0 0 0 0 0 0 1 -4 5 -2
%    0 0 0 0 0 0 0 0 0 0 0 0 1 -2 1 ]

A= load("A.txt");
rows= size(A,1);

for i=1:rows
    A(i,i)= A(i,i) +9;
end

[L,U, counter1] = LU_calc(A); % Calling LU_calc fn for finding L and U matrix for A
X= zeros (rows, rows);
counter2=0;
for i=1: rows
    B= zeros(rows,1);
    B(i)=1;
    [X(:,i),count]= inverse_calc(L,U,B); % Calling inverse_calc fn for getting vector x(i)
    counter2= counter2+count;
end
disp("Inverse of matrix A is: ");
disp(X*A);
fprintf('Number of operation = %i\n', counter1+counter2);
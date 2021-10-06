clear all;
clear;
clc;

A= load('A.txt'); % load matrix A
b= ones(size(A,1),1); % Initialize vector b
roll=39;
b=b*(roll+2);

%%%% Jacobi Method
fprintf('For Jacobi method: \n\n');
y= jacobi_method(A,b);
fprintf('x:\n');
disp(y);

%%%% Gauss Seidel Method
fprintf('For Gauss Seidel method: \n\n');
x= gauss_seidel(A,b);
fprintf('x:\n');
disp(x);
fprintf('A*x=\n');
disp(A*x);

%%%% Gauss Elimination Method
fprintf('For Gauss Elimination method: \n\n');
z= Gauss_elimination(A,b);
z= z.';
fprintf('x:\n');
disp(z);
fprintf('A*x=\n');
disp(A*z);


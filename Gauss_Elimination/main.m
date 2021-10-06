clear all;
clc

% Solving Ax=B using Gauss Elimination method and Back substitution
A= load("A.txt"); % loading A matrix from data file

B= 41*ones(15,1); % B matrix is a constant matrix

X = Gauss_elimination(A,B); % Calling Gauss_Elimination function for solving Ax=B

plot(X);
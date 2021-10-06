clear all;
clear;
clc;

A= [
    4 -1 -1 -1
    -1 4 -1 -1
    -1 -1 4 -1 
    -1 -1 -1 4 ];

eigen_values= zeros(1,4);

[eigen_values(1),x]= deflation(A);

for i= 2:4
    A= A - eigen_values(i-1).*(x*(x.'));
    [eigen_values(i),x]= deflation(A);
end

eigen_values

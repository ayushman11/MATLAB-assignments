clear all;
clear
clc;

A=[
    0.8 -0.4 0
    -0.4 0.8 -0.4
    0 -0.4 0.8 ];
b=[
    41
    25
    105 ];
w=1.2;
[X,err]= SOR(A,b,w);

X
plot(err);
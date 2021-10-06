clear all;
clear;
clc;

%%% Jacobi Method
disp('Jacobi Method');
S= [
    1 0 0
    0 5 0
    0 0 -2 ];

T= [
    0 -1 -6
    -1 0 1
    -4 -2 0];

lamda_max=power_method(S,T)
lamda_min= 1./power_method(T,S)

cond_no= sqrt(abs(lamda_max./lamda_min))

%%% Gauss- Siedel Method
disp('Gauss-Siedel Method');
S= [
    1 0 0
    1 5 0
    4 2 -2];

T= [
    0 -1 -6
    -1 0 1
    -4 -2 0];

lamda_max= power_method(S,T)
lamda_min= 1./power_method(T,S)

cond_no= sqrt(abs(lamda_max./lamda_min))

%%% SOR
disp('SOR Method');
S= [
    1 0 0
    1.2 5 0
    4.8 2.4 -2];

T=[
    0.2 -1.2 -7.2
    0 1 1.2
    0 0 -0.4];

lamda_max= power_method(S,T)
lamda_min= 1./power_method(T,S)

cond_no= sqrt(abs(lamda_max./lamda_min))
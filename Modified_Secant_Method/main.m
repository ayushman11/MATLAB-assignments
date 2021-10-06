clc;
clear;

%Vector P with values from 1 to 100 in 0.1 gap.
P= 1:0.1:100;

% Taking input of initial guess and error limit.
Vo = input('Enter your first guess for volume:');
epsilon = input('Enter value of epsilon:');

% For best accuracy, take epsilon = 1e-4

% delta value for modified secant method.
del = 0.01;

%storing resultant vector V from MSM function
V = MSM(P,Vo,del,epsilon);

figure
plot(V,P)
title('P-V Isotherm at T=345K')
xlabel('V ->')
ylabel('P lying between 1 to 100 ->')

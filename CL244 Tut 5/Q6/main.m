clc;
clear all;
clear;

x=1:9;
y= [1 1.5 2 3 4 5 8 10 13];

[a0, a1]= linear_regression_model(x,y);

[b0, b1, b2]= polynomial_regression_model(x,y);

y_poly= b0 + b1*x + b2*x.^2;

y_avg= (sum(y)/length(y))*ones([1,length(y)]);
y_linear = a0 + a1*x;

St= sum((y-y_avg).^2);
Sr_linear= sum((y-y_linear).^2);
Sr_poly= sum((y-y_poly).^2);

fprintf('Coefficient of Determination (Linear): %f\n',(St-Sr_linear)/St);
fprintf('Coefficient of Determination (Polynomial): %f\n',(St-Sr_poly)/St);

figure(1);
plot(x,y,'om','Linewidth',2);
hold on;
plot(x, y_linear, 'r','Linewidth',1.5);
hold on;
plot(x, y_poly, 'k','Linewidth',1.5);
hold on;
plot(x, y_avg, '--b','Linewidth',1.2);
hold on;
title('Linear/Polynomial Regression Model');
legend('Given scatter data','Linear Regression Line','Polynomial Regression Line','Average line','Location','southeast');
xlabel('\bf X Values');
ylabel('\bf Y values');

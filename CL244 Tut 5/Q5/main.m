clc;
clear all;
clear;

% y = axexp(bx) => ln(y/x) = ln(a) + bx

x= [0.1 0.2 0.4 0.6 0.9 1.3 1.5 1.7 1.8];
y= [0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];

Y = log(y./x);
X = x;

[a0, a1]= linear_regression_model(X,Y);
a = exp(a0);
b = a1;

y_avg= (sum(y)/length(y))*ones([1,length(y)]);
y_poly= a.*x.*exp(b.*x);
St= sum((y-y_avg).^2);
Sr_poly= sum((y-y_poly).^2);
fprintf('Coefficient of Determination (Polynomial): %f\n',(St-Sr_poly)/St);

x_grid=0.1:0.1:1.8;
y_calc= a.*x_grid.*exp(b.*x_grid); % for higher resolution

y_avg= (sum(y)/length(y))*ones([1,length(y)]);


figure(1);
plot(x,y,'om','Linewidth',2);
hold on;
plot(x_grid, y_calc, 'k','Linewidth',1.5);
hold on;
plot(x, y_avg, '--r','Linewidth',1.5);
hold on;
title('Linear Regression Model');
legend('Given scatter data','Calculated Plot','Average line','Location','southwest');
xlabel('\bf X Values');
ylabel('\bf Y values');


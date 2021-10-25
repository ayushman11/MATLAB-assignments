clc;
clear all;
clear;

x=10:10:80;
y= [25 70 380 550 610 1220 830 1450];

[b1, b2]= polynomial_no_intercept(x,y);

y_poly= b1*x + b2*x.^2;

y_avg= (sum(y)/length(y))*ones([1,length(y)]);

St= sum((y-y_avg).^2);
Sr_poly= sum((y-y_poly).^2);

fprintf('Coefficient of Determination (Polynomial): %f\n',(St-Sr_poly)/St);

figure(1);
plot(x,y,'or','Linewidth',2);
hold on;
plot(x, y_poly, 'k','Linewidth',1.5);
hold on;
plot(x, y_avg, '--b','Linewidth',1.2);
hold on;
title('Polynomial Regression Model');
legend('Given scatter data','Polynomial Regression Line','Average line','Location','southeast');
xlabel({'\bf velocity','\bf (in m/s)'});
ylabel({'\bf Force','\bf (in N)'});

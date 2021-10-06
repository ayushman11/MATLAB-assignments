clc;
clear;
clear all;

%% Main.m
a=0; b=30; % integration limits

for i= 1:300
    h(i)= (b-a)./i; % defining step size
end

I_trapezoidal = trapezoidal_rule(h,a,b); % returning integral vector using Trapezoidal rule
I_gauss_quadrature = gauss_quadrature(h,a,b); % returning integral vector using Gauss Quadrature rule


%% Plot
figure()
plot(h, I_trapezoidal,'r');
hold on;
plot(h,I_gauss_quadrature,'b');
title('Integration value vs Step size plot');
legend('Trapezoidal rule','Gauss Quadrature rule','Location','southwest');
xlabel('Step size (h)');
ylabel('Integration value');

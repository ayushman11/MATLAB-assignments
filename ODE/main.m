clc
clear
clear all

h=4; h1=0; h2=0;
x0=0; y1=2; y2=4;

[y_i,z_i]= ODE_solver(x0,y1,y2,h); % initial h result
x=0:h:4;

%plot
figure(1)
plot(x,y_i);
hold on;

figure(2)
plot(x,z_i);
hold on

for i=1:6 %looping for decreasing h values
    h= h./2;
    [y_j,z_j]= ODE_solver(x0,y1,y2,h); % finding y and z for new h
    x=0:h:4;
    
    % Error calculation with prev comparison
    err1=0;
    for k=1:2:length(y_j)
        err_temp1= abs((y_j(k)-y_i((k+1)./2))./y_j(k));
        if(err_temp1 > err1)
            err1= err_temp1;
        end    
    end 
    
    err2=0;
    for l=1:2:length(z_j)
        err_temp2= abs((z_j(l)-z_i((l+1)./2))./z_j(l));
        if(err_temp2 > err2)
            err2= err_temp2;
        end    
    end 
    
    % convergence check & plot
    if(err1 > 1e-4)
    figure(1)
    plot(x,y_j);
    hold on;
    h1=h;
    end
    
    if(err2 > 1e-4)
    figure(2)
    plot(x,z_j);
    hold on;
    h2=h;
    end
    
    % swapping values for next iteration
    y_i=y_j;
    z_i=z_j;
end

% final converged graph 
h1=h1./2; h2= h2./2;
h= min(h1,h2);
[y,z]= ODE_solver(x0,y1,y2,h);
x=0:h:4;
figure(1)
plot(x,y,'Linewidth',1.2);
title('y vs x for different step-size');
legend('Converged graph','Location','southwest');
xlabel('X values');
ylabel('Y values');

figure(2)
plot(x,z,'Linewidth',1.2);
title('z vs x for different step-size');
legend('Converged graph','Location','southwest');
xlabel('X values');
ylabel('Z values');

hold off
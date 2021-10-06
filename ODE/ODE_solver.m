function [y,z]= ODE_solver(x0,y1,y2,h)
    iter=4./h;
    y(1)=y1;
    z(1)=y2;
    x=x0;
    for i=1:iter
        
        % Euler's Explicit rule formula
        y(i+1)= y(i) + h.*dy(x,y(i));
        z(i+1)= z(i) + h.*dz(y(i),z(i));
        
        x= x + h;
    end    
end
%% gauss_quadrature.m
function I= gauss_quadrature(h,a,b)
% Two point method
    for i= 1:length(h) % looping through all step size
        x_l=a;
        t0= 1./sqrt(3); 
        t1= -1./sqrt(3);
        I_temp=0;
        for j=1:i
            x_u= x_l + h(i); % upper bound of interval
            I_temp= I_temp + (f((x_u - x_l).*t0./2 + (x_l + x_u)./2) + f((x_u - x_l).*t1./2 + (x_l + x_u)./2)).*(x_u - x_l)./2; % Gauss Quadrature formula
            
            x_l= x_u; % updating lower bound of next interval
        end
        I(i) = I_temp; % storing integral value for diff. step size
    end
end
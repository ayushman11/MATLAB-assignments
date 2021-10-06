%% trapezoidal_rule.m
function I = trapezoidal_rule(h,a,b)
    for i= 1:length(h) % looping through all step size
        I_temp = f(a) + f(b);
        for j= 1:i-1
            I_temp = I_temp + 2.*f(a + j.*h(i)); % trapezoidal formula
        end
        I(i) = I_temp.*(h(i)./2); % mutiplying by height of trapezium/2
    end
end
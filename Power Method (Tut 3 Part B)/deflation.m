function [lambda_max,Xk] = deflation(A)

Xo= [
    0
    1
    2
    3];
counter=0;
prev_ratio=0;
t=100;
while (t~=0)
    Xk=A*Xo;
    curr_ratio= Xk(3)./Xo(3); % Ratio
    if (abs((curr_ratio-prev_ratio)./curr_ratio) < 1e-6) % comparison
        lambda_max=curr_ratio;
        Xk= Xk./norm(Xk); % Taking euclidean norm
        break;
    end
    counter= counter+1;
    prev_ratio=curr_ratio;
    Xo=Xk;
    t=t-1;
end 
if (t==0)
    disp('No convergence within 100 iterations');
    lambda_max=NaN;
    Xk=NaN;
end
end
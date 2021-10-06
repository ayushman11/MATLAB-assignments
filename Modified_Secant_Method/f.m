function y=f(P,V)
a=3.592;
b=0.04267;
R=0.082056;
T=345;
% y as a function of V. 
y = P*(V.^3) - (P*b + R*T)*(V.^2) + a*V - a*b;
end

function V = MSM(P,Vo,del, epsilon)
% Modified Secant Method

for i= 1:length(P)
    V1 = Vo - (f(P(i),Vo)*del)/(f(P(i),Vo+del) - f(P(i),Vo)); % Modified Secant Method formula
    while abs((V1-Vo)/V1) > epsilon % Break (anti) condition 
            Vo = V1;
            V1 = Vo - (f(P(i),Vo)*del)/(f(P(i),Vo+del) - f(P(i),Vo));
    end
V(i) =V1; % storing value as vector for each P
end

end


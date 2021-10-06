function [x, counter]= inverse_calc(L,U,B)
rows= size(L,1);
d = zeros(rows,1); % Initialize d column vector
counter=0;
for i=1:rows
    B(i);
    temp= 0;
    for j=1:i-1
        temp= temp + L(i,j).*d(j);
    end
    counter= counter + 2.*(i-1) -1;
    d(i)= B(i)-temp; % Forward substitution formula
    counter= counter+1;
end

x= zeros(rows,1); % Initialize x column vector
for i=rows:-1:1
    temp= 0;
    for j=i+1:rows
        temp= temp + U(i,j).*x(j);
    end
    counter= counter+ 2.*(rows-i) -1;
    x(i)= (d(i)-temp)./U(i,i); % Backsubstitution formula
    counter= counter +2;
end
end
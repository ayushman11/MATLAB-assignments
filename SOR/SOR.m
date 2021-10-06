function [X,err]= SOR(A,b,w)

sz=size(A,1);
x= zeros(sz,2);

iter=1;
while true
    
   for i=1:sz
       temp1=0;
       for j=1:i-1
           temp1= temp1 + x(j,2).*A(i,j); % contains new SOR values
       end
       temp2=0;
       for j=i+1:sz
           temp2= temp2 + x(j,1).*A(i,j); % last iter values
       end
      x_gs= (b(i) - temp1 -temp2)./A(i,i); % X(Gauss Seidel)
      x(i,2)= x(i,1) + w.*(x_gs - x(i,1)); % X(SOR)
   end
   max_err=0;
   for k=1:sz
       temp_err= abs((x(k,2)-x(k,1))./x(k,2));
       if(temp_err > max_err) % Checking max error
           max_err= temp_err;
       end
   end
   err(iter)=max_err;
   if(max_err < 1e-6)
       X=x(:,2);
       break;
   end
   x(:,1)=x(:,2); % replacing values
   iter= iter+1;
end    
end
clear all;
clear
clc;

A=[
    0.8 -0.4 0
    -0.4 0.8 -0.4
    0 -0.4 0.8 ];

D=[
    0.8 0 0
    0 0.8 0
    0 0 0.8 ];
L=[
    0 0 0
    -0.4 0 0
    0 -0.4 0 ];

U=[
    0 -0.4 0
    0 0 -0.4
    0 0 0 ];

w=0:0.1:3;
spectral_rad=zeros(length(w),1);

for i=1:length(w)
    X=  inv(D + w(i).*L);
    Y=(1-w(i)).*D - w(i).*U;
    E= X*Y;
    eigen_val= eig(E);
    temp=0;
    for j=1:size(eigen_val)
        if (abs(eigen_val(j)) > temp)
            temp=eigen_val(j);
        end
    end    
    spectral_rad(i)=abs(temp);
end

plot(w,spectral_rad);
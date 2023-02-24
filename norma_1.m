clc, clear all, close all
A=[1 2 3; 2 1 3; 3 3 3]
n=length(A);
norma= zeros(1,n)
for j=1:n
    
    for i=1:n
        norma(1,j)=norma(1,j)+abs(A(i,j))
    end
    
end
max=norma(1,1);
for j=2:n
    if max<norma(1,j);
        max=norma(1,j);
    end
end
max


clc, clear all, close all
A=rand(5,5)
n=length(A);
norma= zeros(n,1)
for i=1:n
    
    for j=1:n
        norma(i,1)=norma(i,1)+abs(A(i,j))
    end
    
end
max=norma(1,1);
for i=2:n
    if max<norma(i,1);
        max=norma(i,1);
    end
end
max

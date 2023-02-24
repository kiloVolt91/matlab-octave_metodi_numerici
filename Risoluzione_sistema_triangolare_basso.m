clc, clear all, close all

T = rand(5,5)
b=rand(5,1)
A=tril(T)
n=length(A)
x=ones(n,1)

x(1)= b(1)/A(1,1)
for i=2:n
        x(i)= (b(i)-A(i,1:i-1)*x(1:i-1))/A(i,i)  
end
c=A\b
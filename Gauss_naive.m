%Gauss naive
clear all, close all, clc

n=5
A=rand(n,n)
b=rand(n,1)
B=A
c=b


for k=1:n-1
    for i=k+1:n
        m(i,k)=A(i,k)/A(k,k)
        for j=k+1:n
            A(i,j)=A(i,j)-m(i,k)*A(k,j)
        end
        b(i)=b(i)-m(i,k)*b(k)
    end
end

T=triu(A)
x=B\c
x=T\b
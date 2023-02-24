close all, clear all, clc

n=4
h=1/2
syms X
x=zeros(1,n+1)
y=zeros(n+1,n+1)
for i=1:n+1
    x(i)=-1+1/2*(i-1)
    y(i,1)=abs(x(i))
end

for j=2:n+1
    for i=1:n
        y(i+1,j)=y(i+1,j-1)-y(i,j-1)
    end
end
v=diag(y)
p=v(1)
k=0
o=2*X+2-k

for i=2:n+1
    p=p+v(i)*o/factorial(i-1)
    k=k+1
    q=2*X+2-k
    o=o*q
end
p 
ezplot(p,[-1,1])



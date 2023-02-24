close all, clear all, clc

A=[3 0 2;1 4 2; 1 2 4]
b= [5 2 1]'
n=length(A)
 % convergenza del metodo
for i=1:n
    if abs(A(i,i))> sum(abs(A(i,1:i-1)))+ sum(abs(A(i,i+1:n))) %dominanza per righe
        dom=1
    else
        dom=0
    end
end
if dom==0
    for j=1:n
        if abs(A(j,j))> sum(abs(A(1:j-1,j)))+ sum(abs(A(j+1:n,j))) %dominanza per colonne
            dom=1
        else
            dom=0
        end
    end
end
if dom==1
    N=diag(diag(A))
    P=N-A
    Ni=inv(N)
    x=zeros(n,1)
    xp=ones(n,1)
    tau=0.0001
    iter=200
    k=1
while norm(abs(xp-x))>tau &  k<iter
    
    xp=x
    x=Ni*P*x+Ni*b
    k=k+1
end
x
k
e=A\b;
eps=norm(abs(x-e))
end
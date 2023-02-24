clear all, close all, clc

A=[-5 4; 3 3]
v0=[1 1]'
t=v0/norm(v0)
lambdap=0
lambda=1
tau=0.0000000000005
k=1
iter=100
while abs(lambdap-lambda)>tau & k<iter
    
    lambdap=lambda;
    v=A*t;
    t=v/norm(v);
    lambda=t'*A*t;
    k=k+1;
end
lambda
k
eig(A)

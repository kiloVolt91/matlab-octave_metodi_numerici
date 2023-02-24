A=rand(5,5)
syms x1 x2 x3 x4 x5
x=[x1 x2 x3 x4 x5]'
I=diag(diag(ones(5,5)))
solve(A-x*I==0,x)

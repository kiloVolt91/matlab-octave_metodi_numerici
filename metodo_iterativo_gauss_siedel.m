close all, clear all, clc


A=[3 -2 0;1/2 1 1/4; 0 -3 4]
b=[4 3 12]'
n=length(A)
N=tril(A)
Ni=inv(N)
P=N-A
D=diag(diag(N))
Di=inv(D)
M=D-N

x=zeros(n,1)
xp=ones(n,1)
tau=0.001
k=1

while norm(abs(x-xp))>tau
    xp=x
    xi=Ni*P*x+Ni*b
    x=Di*M*xi+Di*P*x+Di*b
    k=k+1
end

x
k
xe=A\b
e=norm(abs(xe-x))

%condizione di convergenza del metodo gauss siedel è che A sia diagonale in
%senso forte per righe o colonne, altrimenti altra condizione è che A sia
%definita positiva ( Criterio di Sylvester)

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
dom

    
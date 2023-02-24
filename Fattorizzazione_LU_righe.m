close all, clear all, clc
n=5
A=rand(n,n)
B=A
for k=1:n-1
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k)
    end
    j=[k+1:n]
    A(i,j)=A(i,j)-A(i,k)*A(k,j)
end


L=tril(A,-1)+diag(diag(ones(n,n)))
U=triu(A)

C=L*U
B
    %% ERRORE NON FUNZIONA
    

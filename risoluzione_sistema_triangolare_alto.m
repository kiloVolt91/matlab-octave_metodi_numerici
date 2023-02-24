% Risoluzione sistema triangolare alto
clc, clear all, close all

T = rand(5,5)
b=rand(5,1)
A=triu(T)
n=length(A)
x=ones(n,1)

x(n)= b(n)/A(n,n)
for i=n-1:-1:1
        x(i)= (b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i)  % l'indice della sommattoria va all'interno del pedice di colonna,
                                                 % dal momento che, porre gli estremi di sommataria in un ciclo for 
                                                 % esterno non fa ottenere la sommatoria ma un aggiornamnto iterato
                                                 % del risultato
end
c=A\b
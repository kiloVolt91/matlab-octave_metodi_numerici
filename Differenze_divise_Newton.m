%differenze divise di Newton

clc, clear all, close all
c=[1 1;3 2;4 4;5 5; 6 9] %coordinate funzione sulla prima colonna vi sono le ascisse, sulla seconda colonna le ordinate
[n,m]=size(c)
syms x

DD=zeros(n-1,n-1) %matrice di ordine inferiore poichè non considero la prima colonna dei termini f(x) noti

for i=1:n-1
    DD(i,1)=(c(i+1,2)-c(i,2))/(c(i+1,1)-c(i,1)) %costruzione della prima colonna della matrice (in realtà è la seconda colonna della matrice completa)
end
for j=2:n-1
    k=j-1
    for i=j:n-1
        DD(i,j)=(DD(i,j-1)-DD(i-1,j-1))/(c(i+1,1)-c(i-k,1)) %costruzione della restante parte della matrice (terza colonna della matrice completa)
    end
end

P=sym(c(1,2))
k=1
o=(x-c(1,1))
while k<n-1
    P=P+o*DD(k,k)
    k=k+1
    o=o*(x-c(k,1))
end
P
ezplot(P,[0,7])
hold on
for i=1:n
    plot(c(i,1),c(i,2),'+r')
end

    

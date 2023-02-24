% Polinomio osculatore Newton alle differenze divise 

clc, clear all, close all
c=[-2 6 -5;0 0 -1;1 0 1] %coordinate funzione sulla prima colonna vi sono le ascisse, sulla seconda colonna le ordinate
[n,m]=size(c)
syms q
x=c(1:n,1)
y=c(1:n,2)
d=c(1:n,3)
h=zeros(2*n,1)
h(1)=x(1)

DD=zeros(2*n,2*n)
k=1
for i=1:2:2*n
    DD(i,1)= y(k) % costruzione dei termini dispari della prima colonna delle differenze divise 
        k=k+1
end
k=1
for i=2:2:2*n
    DD(i,1)=y(k) % costruzione dei termini pari della prima colonna delle differenze divise 
    h(i)=x(k) %h è il vettore dei punti doppi
    k=k+1
end
k=2
for i=3:2:2*n
        DD(i,2)=(DD(i,1)-DD(i-1,1))/(x(k)-x(k-1)) % costruzione dei termini dispari della seconda colonna
        h(i)=x(k)
        k=k+1
end
k=1
for i=2:2:2*n
    DD(i,2)=d(k) % costruzione dei termini pari della seconda colonna
    k=k+1
end

for j=3:2*n
    k=j-1
    for i=j:2*n
        DD(i,j)=((DD(i,j-1)-DD(i-1,j-1)))/((h(i)-h(i-k)))
    end
end

% costruzione del polinomio
DI=diag(DD)
P=sym(DI(1))
k=2
o=(q-h(1))
while k<2*n-1
    P=P+o*DI(k)
    k=k+1
    o=o*(q-h(k-1))
end
        
ezplot(P,[-3,2])
hold on
for i=1:n
    plot(c(i,1),c(i,2),'+r')
end




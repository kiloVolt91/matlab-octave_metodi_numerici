%differenze finite all'indietro

clc, clear all, close all

y=[0 1 0 -1 0]' % punti della funzione
n=length(y)
h=linspace(0,1,5)
DF=zeros(n,n)
for i=1:n
    DF(i,1)=y(i)
end
for j=2:n
    for i=1:n-j+1
        DF(i,j)=DF(i+1,j-1)-DF(i,j-1)
    end
end

syms x t
v=zeros(n,1)
g=n
for j=1:n
        v(j)=DF(g,j)
        g=g-1
end
p=v(1)       % inizializzazione del polinomio p
k=0          % inizializzazione contatore

o=(k-t)/(k+1) % inizializzazione termini intermedi prodotto
for i=2:n
    p=p+o*v(i) %calcolo polinomio
    k=k+1 % incremento il contatore
    q=(k-t)/(k+1) % aggiorno il moltiplicatore in q
    o=o*q % aggiorno il valore o
end
p=subs(p,t,(h(n)-x)/(abs(h(2))-abs(h(1)))) %sostituisco a t il valore corrispondente di x 


ezplot(p,[h(1),h(n)])
hold on
plot(h,y,'+r')

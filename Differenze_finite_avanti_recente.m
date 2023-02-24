%differenze finite in avanti

clc, clear all, close all

y=[0 1 0 -1 0]' % valori della funzione 
n=length(y)
h=linspace(0,1,5)  % creazione punti equispaziati su asse x
DF=zeros(n,n)      % inizializzazione matrice delle differenze finite DF
for i=1:n
    DF(i,1)=y(i)   % sostituzione della prima colonna di DF con i valori di y
end
for j=2:n
    for i=j:n
        DF(i,j)=DF(i,j-1)-DF(i-1,j-1) % calcolo dei termini restanti della matrice DF
    end
end
syms t x  
v=diag(DF)   % vettore contenente la diagonale delle DF
p=v(1)       % inizializzazione del polinomio p
k=0          % inizializzazione contatore

o=(t-k)/(k+1) % inizializzazione termini intermedi prodotto
for i=2:n
    p=p+o*v(i) %calcolo polinomio
    k=k+1 % incremento il contatore
    q=(t-k)/(k+1) % aggiorno il moltiplicatore in q
    o=o*q % aggiorno il valore o
end
p=subs(p,t,(x-h(1))/(abs(h(2))-abs(h(1)))) %sostituisco a t il valore corrispondente di x 

    


ezplot(p,[h(1),h(n)])
hold on
plot(h,y,'+r')
simple(p)

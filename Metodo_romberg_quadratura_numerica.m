clc, clear all, close all

%Metodo di Romberg quadratura automatica



% Si costruisce una matrice triangolare inferiore. In tale matrice possiamo
% individuare la prima colonna, costituita dai calcoli approssimati
% dell'integrale all'aumentare del numero di punti dell'intervallo, mentre
% la seconda e le successive colonne sono calcolate come: rapporto tra
% T(i,j-1)-T(i-1,j-1) e 2^(p+1)-1. s è l'ordine della matrice o numero di
% partizione indicato come n=2^s. n si muove raddoppiando se stesso.

a=0 %inizio intervallo
b=1 %fine intervallo
syms x
y=x*(x^2+1)^(1/2) % funzione da integrare
s=3 %ordine della matrice
ex=0:s % creazione vettore per elevazione a potenza, in modo da ricavare n
n=2.^ex % creazione del vettore n
m=length(n)

%costruzione della prima colonna

for i=1:m
    h=(b-a)/n(i) % definizione dell'intervallo h al variare del numero di punti
    k=a:h:b      % vettore dei punti 
    r=length(k)  %lunghezza vettore dei punti
    for j=1:length(k)
        f(j)=subs(y,k(j))  % calcolo dei valori della funzione nel punto 
    end
    T(i,1)= h*((f(1)+f(r))/2+sum(f(2:r-1))) %costruzione della prima colonna
end


%costruzione della restante matrice 
for j=2:s
    for i=j:s+1
        p=2*j-1 % grado di precisione
        T(i,j)=(T(i,j-1)-T(i-1,j-1))/(2^(p+1)-1)+T(i,j-1)
    end
end
    
    double(T)
    
    

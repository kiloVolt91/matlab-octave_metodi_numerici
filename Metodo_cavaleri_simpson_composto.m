clc, clear all, close all

% Metodo Cavaleri Simpson composto (su più intervalli)
m = 4 % numero di intervalli
a = -1 % estremo sinistro intervallo
b = 1 % estremo destro intervallo
h = (b-a)/m % grandezza intervallo

x = -1:h:1 % Creazione del vettore di punti 
n=length(x) %lunghezza vettore x

syms t
f=t^2*sqrt(1-t^2);   % Funzione da integrare 
for i=1:n
    y(i)=subs(f,x(i)) % Vettore dei valori della funzione nei punti
end

for i=1:n-1
    xmed(i) = (x(i)+x(i+1))/2
end
ymed = subs(f,xmed)

I=0
for i=1:n-1
    I= I+y(i)+4*ymed(i)+y(i+1)
end
I=I*h/6
double(I)

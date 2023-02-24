% Formule composite generalizzate con metodo dei trapezi

clc, clear all, close all 


h = 0.1
b = 3
x = 0:h:b % Creazione del vettore di punti
n=length(x)

syms t
f=t^2;   % Funzione da integrare 
for i=1:n
    y(i)=subs(f,x(i)) % Vettore dei valori della funzione nei punti
end
Int=y(1)+y(n)
for i=2:n-1
    Int = Int + 2*y(i)
end
Int =h/2*Int

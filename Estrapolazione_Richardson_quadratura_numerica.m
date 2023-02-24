clc, close all, clear all

% quadratura automatica con metodo dei trapezi (ESTRAPOLAZIONE DI
% RICHARDSON)

a=0
b=3
e=1
d=2
p=4 %grado di precisione
Int0=0
toll=0.001
while e > toll
    h=(b-a)/d
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
    d=d+1
    e=abs((Int-Int0)/(2^(p+1)-1))
    Int0=Int
end
Int
e
passi = d-1

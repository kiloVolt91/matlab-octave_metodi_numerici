% Minimi quadrati nel discreto retta
clc, clear all, close all

u=2 % Grado del polinomio +1 (funzione approssimante, u=2 retta, u=3 parabola ...)
y=[0.8415,1.6551,0.527,0.4391,0.3752]' % Valori reali
x= [1 1.4 1.8 2.2 2.6]'      % Punti in corrispondenza del valore reale
n=length(x)
A=ones(n,u)  % Inizializzazione matrice A con tante righe quanto sono i punti
a=sym(zeros(u)') % Inizializzazione vettore simbolico dei coefficienti alpha
syms w

for i=1:n
    A(i,u)=x(i)
end
B=A'*A
c=A'*y
a=B\c % poichè B*a=c

P=sym(a(1))
for i=2:u
    P=P+a(i)*w
    w=w*w
end
ezplot(P,[x(1)-1,x(n)+1])
hold on
for i=1:n
    plot(x(i), y(i), '+r')
end

    






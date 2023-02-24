% Minimi quadrati nel discreto parabola
clc, clear all, close all

u=3 % Grado del polinomio (funzione approssimante, u=1 retta, u=2 parabola ...)
y=[0.8415,1.6551,0.527,0.4391,0.3752]' % Valori reali
x= [1 1.4 1.8 2.2 2.6]'      % Punti in corrispondenza del valore reale
t=x.^2 %terza colonna della matrice A
n=length(x)
A=ones(n,u)  % Inizializzazione matrice A con tante righe quanto sono i punti
a=sym(zeros(u)') % Inizializzazione vettore simbolico dei coefficienti
syms w

for i=1:n
    A(i,2)=x(i)  % Sostituzione Dei valori di x nella seconda colonna
    A(i,3)=t(i)  % Sostituzione dei valori di t nella terza colonna
end

B=A'*A
c=A'*y
a=B\c % poichè B*a=c

P=sym(a(1))
for i=2:u
    P=P+a(i)*w
    w=w*w
end
ezplot(P,[x(1),x(n)])
hold on
for i=1:n
    plot(x(i), y(i), '+r')
end



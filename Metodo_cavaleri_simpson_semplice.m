% Metodo cavaleri-simpson, calcolo integrale su singolo intervallo
clc, clear all, close all
syms x
f=x^2 % funzione di input
x=zeros(1,3)
x(1)=0;
x(3)=3;
x(2)=(x(1)+x(3))/2;

h=x(2)-x(1);
for i=1:3
    y(i)=subs(f,x(i))
end

Int= h/3*(y(1)+y(3)+4*y(2))



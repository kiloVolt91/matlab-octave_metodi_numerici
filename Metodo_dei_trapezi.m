% Metodo dei trapezi, calcolo integrale
clc, clear all, close all
syms x
f=x^2 % funzione di input
x=zeros(1,2)
x(1)=0;
x(2)=3;
h=x(2)-x(1);
for i=1:2
    y(i)=subs(f,x(i))
end

Int= h/2*(y(1)+y(2))



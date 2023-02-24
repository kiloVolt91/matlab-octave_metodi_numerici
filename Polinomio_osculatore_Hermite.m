%Polinomio Hermite Lagrange

clc, clear all, close all
c=[0.49 0.7 0.71;0.64 0.8 0.625] %coordinate funzione
[n,m]=size(c)
syms x
%calcolo dei polinomi fondamentali Lk=(x-xi)/(xk-xi) con k!=i (diverso)con
%i che va da 0 ad n

L=sym(zeros(n,1)) % creazione di una matrice con elementi simbolici all'interno

for k=1:n
    num=1
    den=1
    for i=1:n 
        if i~=k
           num=num*(x-c(i,1))
           den=den*(c(k,1)-c(i,1))
           L(k)=num/den
        end
        
    end
end
dL=diff(L)
U= sym(zeros(n,1))
V=sym(zeros(n,1))
P=sym(0)

for i=1:n
  U(i)=c(i,2)*(1-2*(x-c(i,1))*subs(dL(i),x,c(i,1)))*L(i)^2
  V(i)=c(i,3)*(x-c(i,1)*L(i)^2)
end
P=sum(U)+sum(V)
ezplot(P,[0.3,1])
hold on
for i=1:n
    plot(c(i,1),c(i,2),'+r')
end
for i=1:n
    e=subs(P,x,c(i,1))-c(i,2)
end



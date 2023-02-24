clc, clear all, close all

% Crezione funzione Spline cubica interpolante naturale

n= 3 % Ordine della funzione spline

r = [-2,-1,0,1,2] % Vettore dei punti in cui interpolare la funzione, nel caso di punti equispaziati usare un linspace definendo il numero di punti (k) prima

k = length(r) % numero di punti dell'intervallo

% Inserire qui la funzione f(x) da interpolare, in questo caso, f(x)=abs(x)

y = abs(r) % Valori della funzione nei punti f(xi)

for i=1:k-1
    h(i,1)=abs(r(i)-r(i+1))   % tali intervalli saranno uguali se i punti sono equispaziati
end

% Implementazione della formula per il calcolo degli elementi della matrice
% tridiagonale. Essendo la matrice tridiagonale saranno al più 3 gli
% elementi presenti
A=zeros(k-2,k-2)
b=zeros(k-2,1)
for i=1:k-2
    A(i,i)=2*(h(i)+h(i+1))
    if i~=1
        A(i,i-1)=h(i)
    end
    if i~=k-2
        A(i,i+1)=h(i+1)
    end
    b(i)=6*((y(i+2)-y(i+1))/h(i)-(y(i+1)-y(i))/h(i))
end
M=A\b
N=[0;M;0]
for i=1:k-1
    C(i)=(y(i+1)-(y(i)))/h(i) - h(i)/6*(N(i+1)-N(i))
    D(i)= y(i)-h(i)^2/6*N(i)
end

syms x
S=sym(zeros(k-1,1))


for i=1:k-1
    S(i)=(1/(6*h(i)))*((x-r(i)).^3)*N(i+1)+(1/(6*h(i)))*((r(i+1)-x).^3)*N(i) + C(i)*(x-r(i))+D(i)
end

for i=1:n
    ezplot(S(i),[r(i),r(i+1)])
    hold on
end


    






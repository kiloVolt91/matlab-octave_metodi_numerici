%Polinomio interpolante di Lagrange
clc, clear all, close all
c=[0 1; pi/3 0.5; 2*pi/3 -0.5] %coordinate funzione
[n,m]=size(c);
syms x;
%calcolo dei polinomi fondamentali Lk=(x-xi)/(xk-xi) con k!=i (diverso)con
%i che va da 0 ad n

L=sym(zeros(n,1)); % creazione di una matrice con elementi simbolici all'interno


% Calcolo dei coefficienti di Lagrange 
for k=1:n
    num=1;
    den=1;
    for i=1:n 
        if i~=k
           num=num*(x-c(i,1)); % Numeratore del coefficiente di Lagrange 
           den=den*(c(k,1)-c(i,1)); % Denominatore del coefficiente di Lagrange
           L(k)=num/den; % Coefficiente di Lagrange 
        end
        
    end
end

% Calcolo del polinomio di Lagrange 

P=sym(0); % Inizializzazione del polinomio
for i=1:n
    P=P+(L(i)*c(i,2)); % Calcolo del polinomio 
end

% Grafico della funzione

ezplot(P,[0,2*pi/3]) % Plot della funzione simbolica interpolante in un intervallo limitato da 0 a pi*2/3
hold on;
for i=1:n
    plot(c(i,1),c(i,2),'+r') % Posizionamento dei punti sul grafico (dati iniziali)
    hold on;
end


% Calcolo dell'errore nel punto x=1

P1=subs(P,1) % Valore della funzione nel punto 1
w=1 % inizializzazione di omega = (x-x0)*(x-x1)*(x-x2)
for i=1:n
    w=w*(x-c(i,1));
end

% Differenziale del polinomio al fine di valutare l'errore

D=diff(P); % Inizializzazione della derivata
for i=2:n
    D=diff(D); % Calcolo delle derivate successive
end
E=(subs(w,1)*subs(D,1))/factorial(n) % Calcolo dell'errore nel punto desiderato, in tal caso x=1
   
P=simple(P) % Semplificazione del polinomio interpolante per la presentazione in uscita


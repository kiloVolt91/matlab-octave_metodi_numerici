% Risoluzione sistema triangolare alto

function [x] = rtriup(A,b)
% A matrice triangolare alta in ingresso
% b vettore dei termini noti
n=length(A);
x=ones(n,1);
x(n)= b(n)/A(n,n);
for i=n-1:-1:1
        x(i)= (b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i)  % l'indice della sommattoria va all'interno del pedice di colonna,
                                                 % dal momento che, porre gli estremi di sommataria in un ciclo for 
                                                 % esterno non fa ottenere la sommatoria ma un aggiornamnto iterato
                                                 % del risultato
end
return
end

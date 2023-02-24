%Risoluzione sistema triangolare basso
function [x] = rtrilow(A,b)
% A matrice di input, triangolare bassa
% b vettore dei termini noti
n=length(A);
x=ones(n,1);

x(1)= b(1)/A(1,1);
for i=2:n
        x(i)= (b(i)-A(i,1:i-1)*x(1:i-1))/A(i,i)  
end
return
end
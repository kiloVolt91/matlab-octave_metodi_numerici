% Gauss naive


function  [A,b] = gaussnaive(A,b)
% A matrice di ingresso
% b vettore dei termini noti
n=length(A);
for k=1:n-1
    for i=k+1:n
        m(i,k)=A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j)=A(i,j)-m(i,k)*A(k,j);
        end
        b(i)=b(i)-m(i,k)*b(k);
    end
end
A=triu(A)
b
end

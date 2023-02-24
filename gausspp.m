%gauss con pivoting parziale

function [A,b] = gausspp(A,b)
% A matrice di ingresso da trasformare
% b vettore dei termini noti da trasformare
n=length(A);
for k=1:n-1
    piv=k;
    for i=k+1:n
        if A(k,k)==0
            piv=i;
            for j=k:n
                t= A(k,j);
                A(k,j)=A(piv,j);
                A(piv,j)=t;
            end
                p=b(k);
                b(k)=b(piv);
                b(piv)=p;
           
        else
            m(i,k)=A(i,k)/A(k,k);
            for j=k+1:n
                A(i,j)=A(i,j)-m(i,k)*A(k,j);
            end
            b(i)=b(i)-m(i,k)*b(k);
         end
    end
end
A=triu(A)
b
end

                      
             
            
          
%Gauss con pivoting completo

function [A,b] = gausspt(A,b)
% A matrice di ingresso da trasformare
% b vettore dei termini noti da trasformare

n=length(A);
for k=1:n-1
    piv=k;
    max=abs(A(k,k));

    for i=k+1:n
        if abs(A(i,k))>max          
            max=abs(A(i,k));
            piv=i ;
            if piv>k 
              for j=k:n
                  t=A(k,j);
                  A(k,j)=A(piv,j);
                  A(piv,j)=t;
              end
                  p=b(k); %da tenere al di fuori del ciclo for per non causare scambi continui con causa di errori
                  b(k)=b(piv);
                  b(piv)=p;
            end
        end
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


            
            
            
 
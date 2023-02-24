% Fattorizzazione LU per righe
function [L,U] = factlur(A)
n=length(A)
for k=1:n-1
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k);
    end
    j=[k+1:n];
    A(i,j)=A(i,j)-A(i,k)*A(k,j);
end


L=tril(A,-1)+diag(diag(ones(n,n)))
U=triu(A)
end


%% ERRORE, NON FUNZIONA
    

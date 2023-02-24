clear all, close all, clc


%% errore
A=rand(5,5)
n=length(A)
if A'==A
if det(A(1,1))>0
    if det(A(1:2,1:2))>0
        if det(A)>0
            if A'==A
                for j=1:n
                    
                        for k=1:j-1
                            A(j,j)=A(j,j)-A(j,k)*A(j,k)
                        end
                            A(j,j)=sqrt(A(j,j))
                        
                   
                    
                    
                    for i=j+1:n
                        for k=1:j-1
                             A(i,j)=A(i,j)-A(j,k)*A(i,k)
                             A(i,j)=A(j,j)
                            
                        end
                    end
                end
            end
        end
    end
end
end
A=tril(A)
B=A*A'
                    
        
           
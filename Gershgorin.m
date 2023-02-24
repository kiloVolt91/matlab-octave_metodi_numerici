close all, clear all, clc
A=[10 1 -1; 1 -3 2; -1 2 3]
n=length(A)
B=A'

% For each row, we say:
for i=1:n
    % il cerchio è centrato in (h,k) dove h è la parte reale di A(i,i) e
    % k è la parte immaginaria di A(i,i)   :
    h=real(A(i,i));
    k=imag(A(i,i));
    
% Calcolo dl raggio dei cerchi come somma dei valori assoluti dei singoli
% elementi, escluso l'elemento diagonale
    r=0
    r=sum(abs(A(i,1:n)))-A(i,i)
    g=0
    g=sum(abs(B(i,1:n)))-B(i,i)

    
    % Vettore di punti per il cerchio
    N=256;
    t=(0:N)*2*pi/N;
    
    %Mappatura degli elementi nei cerchi
    plot( r*cos(t)+h, r*sin(t)+k ,'-r');
    hold on;
    plot(g*cos(t)+h,g*sin(t)+k,'-b')
    hold on;
    grid;
    % posizionamento centri dei cerchi
    hold on;
    plot( h, k,'+b');
    hold on;
    
end


% Uguaglianza degli assi al fine di ottener graficamente dei cerchi
axis equal;

% Autovalori della matrice
ev=eig(A);
for i=1:size(ev)
    rev=plot(real(ev(i)),imag(ev(i)),'ro');
end
hold off;
legend(rev,'Autovalori');
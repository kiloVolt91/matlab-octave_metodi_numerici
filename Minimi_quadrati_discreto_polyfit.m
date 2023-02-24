clc, clear all, close all
% Si ipotizzano delle misure effettuate su degli intervalli regolari di
% ampiezza x=0,01. Si determina quindi il vettore x

x=0:0.01:1
n=length(x)

e=(rand(1,n)-0.5)*0.5 % creiamo una matrice di errore moltiplicandola per un coefficiente tale da non influire troppo sul modulo dei termini f(x)
for i=1:n
    y(i)=1.5*x(i)-2+e(i)  %genero un insieme di punti sulle ordinate in corrispondenza delle x, affetto da errore 
end

p=polyfit(x,y,1) % retta approssimante al variare di n migliora l'approssimazione ai punti, al più per n= length(x)-1 miglire approssimazione 
h=polyval(p,x)

plot(x,h)
hold on
plot(x,y,'r o')
 legend('funzione approssimante','valori sperimentali')










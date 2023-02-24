clc, clear all, close all

x=linspace(-pi,pi,300)
n=length(x)
f1=sin(x)


p=polyfit(x,f1,n-1)
f2=polyval(f1,x)

plot(x,f1)
hold on
plot(f2,f1,'r.')


%% non funziona, non è utile 
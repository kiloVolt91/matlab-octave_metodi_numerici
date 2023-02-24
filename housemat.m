function [H,k] = housemat(x) %costruzione matrice di Householder
n = size(x,1)
sigma = norm(x);
if x(1)>=0
 k = -sigma;
else
 k = sigma;
end
beta = sigma*(sigma+abs(x(1)));
e = [1;zeros((n - 1),1)];
v = x- k*e;
H = eye(n)-(1/beta)*v*v'; 
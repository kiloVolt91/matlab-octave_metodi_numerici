n = 5; % dimensione della matrice A

A = rand(n); % genero una matrice casuale A di
 % dimensione n
Q = eye(n); % inizializzo la matrice Q

for i = 1:n-1 % il ciclo for è costituito da n – 1
 % passi
 sottomatr = housemat(A(i:n,i)); % sottomatr è l'output della funzione
 % housemat
 % che prende in ingresso la
% colonna i-esima della matrice A
% e le righe dalla i alla n

 for j = i:n % aggiorno la matrice A
 A(i:n,j) = sottomatr*A(i:n,j);
 end

 H = eye(n,n); % prepariamo la matrice H nel caso in
 % cui sia necessaria
 % un' "orlatura"

 [m,m] = size(sottomatr); % dimensione della matrice sottomatr
 if m ~= n
 H((n-m+1):n,(n-m+1):n)= sottomatr; % dobbiamo verificare se la dim.della
 % matrice sottomatr
 % è pari a n x n, in caso
% contrario dobbiamo "orlare" la
% matrice sottomatr inserendo
% tante righe e colonne della
% matrice identità in modo da
% ottenere la dim. n x n
 else
 H = sottomatr; % se m = n non occorre nessuna
 % orlatura
 end
 Q = Q*H; % Q è data dal prodotto delle i
 % matrici H ottenute
 % R è uguale alla matrice A
end

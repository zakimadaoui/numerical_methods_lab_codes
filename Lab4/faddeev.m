A  = [2 1 1; -1 1 -1; 1 2 3];
C  = [2;3;-10];
[n,m] = size(A);


B  = zeros(n, n, n);
B(1:end,1:end,1)  = A;


P = zeros(n);
identityMat = eye(n);


for k = 1:n-1
  P(k) = (1/k)*trace(B(1:end,1:end,k));
  B(1:end,1:end,k+1) = A * (B(1:end,1:end,k)-P(k)*identityMat);
endfor
  
P(n) = (1/n)*trace(B(1:end,1:end,n));

A_inv = (1/P(n)) * (B(1:end,1:end,n-1) - P(n-1)*identityMat)

X = A_inv*C




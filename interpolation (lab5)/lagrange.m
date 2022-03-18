function retval = lagrange(x_val, X_samples, Y_samples, Order) % X and Y are Row vectors 

X = X_samples;
Y = Y_samples;
% order/degree of polynomial denoted N
% number of discrete points denoted k = N+1
K = Order +1;

if(Order >= length(X))
    disp('Order must be less than number of sample by at least 1');
    retval = nan;
    return;
endif


% init Lagrange coefficient polynomial
L = ones(1,K);

P_N = 0;
for j = 1:K %loop for computing P_N  = ∑ y_j * L_j(X)
    for i = 1:K % compute L_j = ∏ (x-xi)/(xj - xi)
        if(i != j) %ignore j==i case as it gives a L(j) = L(j)*1 = L(j) !
            L(j) = L(j) * (x_val - X(i))/(X(j) - X(i));
        endif
    endfor
    P_N = P_N +  Y(j) * L(j);
endfor

retval = P_N;
endfunction





% format long;

a=0; b=pi; % The Endpoints
f = @(x) sin(x);
N = 7;
R = zeros(N,N);


%equation 1 (trapezoidal integration NOT OPTIMIZED)
for k=1:N 
    R(k,1) = trap2(f,a,b,k);
end

disp('R first')
disp(R)
%equation 1 (trapezoidal integration OPTIMIZED)
R(1,1) = (b - a)/2*(f(a) + f(b)) %calculate first R term

for k=2:7
    h = (b - a)/(2** (k-1)) ;
    h1 = (b - a)/(2** (k-2)) ;
    sum = 0;
    %equation 1 (trapezoidal integration)
    for i = 1:2**(k-2)
        sum = sum +  f(a + h*(2*i-1));
    endfor
    R(k,1) = 0.5 *R(k - 1,1) +  h*sum ;
end

disp('R second')
disp(R)

%reducing errors using extrapolation
%previous column needs to be computed 
% that's why we compute col 1 using trapezoidal
for col = 2:N %cols
    for k = col:N %rows
        div = 2**col - 1;
        prev_col = col-1;
        R(k,col) = R(k,prev_col) + (R(k,prev_col) - R(k-1,prev_col))/div; 
    endfor
endfor

disp(R)
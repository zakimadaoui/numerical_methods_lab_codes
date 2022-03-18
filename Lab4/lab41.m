 %//TODO: pivot correction

A  = [2 1 1; -1 1 -1; 1 2 3]
n = length(A);
B  = eye(n);
AB = [A B]


if (det(A) == 0)
    disp('not possible, some rows are redundant!');
endif

%Gauss elimination
for col = (1:n-1) 
    fprintf('----------------- stage %d ----------------- \n',col);
    for row = (col+1:n)

        max_index = max(AB(row:n ,col)); %get row index of max pivot
            
        if(max_index != row) %avoid swaping same row
            temp_row =  AB(max_index,1:end);     %store row of max pivot
            AB(max_index,1:end) = AB(row,1:end); %swap
            AB(row,1:end)       = temp_row;
        endif;


        m = AB(row,col)/AB(col,col);
        AB(row,1:end) = AB(row,1:end) - m .* AB(col,1:end)
    endfor
endfor

%factorize new A and B
A = AB(1:end,1:n);
B = AB(1:end,n+1:end);


%Back substitution

X = zeros(n);

for i = (1:n) 
    X(n,i) = B(n,i)/A(n, n);
endfor


for i = (n-1:-1:1) 
    for k = (n:-1:1) %fix column for x first
        %calculate the sum term for X(..,k)
        sum = 0;
        for j = (i+1:n)
        sum = sum + (A(i,j)*X(j,k));
        endfor
       X(i,k) = (1/A(i,i))*(B(i,k) - sum);
    endfor
endfor


inverse0 = X 

A  = [2 1 1; -1 1 -1; 1 2 3]
true_inverse = inverse(A)
disp('A x A_inv = ')
X * A



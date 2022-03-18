A  = [2 1 1; -1 1 -1; 1 2 3];
B  = [2;3;-10];
n  = length(A);
X  = zeros(n,1);

iters = input('insert iterations: ');
count = 0;
for count = 1:iters
    for row = 1:n 
    sum = 0;
        for col = 1:n 
            if(row != col) 
                sum = sum + X(col)*A(row, col);
            endif;          
        endfor
    X(row) = (B(row) - sum)/A(row,row);
    endfor
    fprintf('iteration %d finished, result is\n', count);X
endfor


% iters = 75 gives a accurate result !
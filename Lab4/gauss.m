


function retval = gauss(A, B)

    AB = [A B];
    n = length(A);

    if (det(A) == 0)
        disp('not possible, some rows are redundant!');
    endif

    %Gauss elimination
    for col = (1:n-1) %cols
        fprintf('----------------- stage %d ----------------- \n',col);
        for row = (col+1:n)%row


            max_index = max(AB(row:n ,col)); %get row index of max pivot
            
            if(max_index != row) %avoid swaping same row
                temp_row =  AB(max_index,1:end);     %store row of max pivot
                AB(max_index,1:end) = AB(row,1:end); %swap
                AB(row,1:end)       = temp_row;
            endif;

            m = AB(row,col)/AB(col,col);
            AB(row,1:end) = AB(row,1:end) - m * AB(col,1:end)
        endfor
    endfor

    %factorize new A and B
    A = AB(1:end,1:n);
    B = AB(1:end,n+1:end);


    %Back substitution

    X = zeros(n,1);
    X(n) = B(n)/A(n, n);


    for i = (n-1:-1:1) 
        sum = 0;
        for j = (i+1:n)
        sum = sum + (A(i,j)*X(j)); 
        endfor
        X(i) = (B(i) - sum)/A(i,i);
    endfor

    retval = X;
endfunction


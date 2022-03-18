function retval = trap2(f, a, b, N)

    hn = (b - a)/(2**(N-1));
    retval = f(a);

    for i = 1:2**(N-1)
        x = a+ i*hn;
        retval = retval + 2* f(x);
    endfor

    retval = (retval + f(b)) * hn * 0.5;

endfunction
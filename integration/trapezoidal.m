function retval= trapezoidal(f,a, b, N)

    retval = 0;   %init
    dx = (b-a)/N; %get increments
    

    retval = f(a);

    for i = 1:N-1 
      x = a + i*dx; %advance in x-axis by dx
      retval = retval + 2*f(x);
    endfor

    retval = retval + f(a+N*dx);
    retval = retval * dx * 0.5;

endfunction
function retval= rayman(f,a, b, N)

    retval = 0; %init
    dx = (b-a)/N; %get increments
    
    for i = 0:N-1 
      x = a + i*dx; %advance in x-axis by dx
      retval = retval + f(x)*dx; % don't forget to multiply by dx
    endfor

endfunction
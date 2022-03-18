function secant (fx_compute, dx, epsi, xn0)
    xn1 = 0;
    xn2 = 0;

    fxn = fx_compute(xn0);
    fxn1 = fxn;

    %incremental search
    f_product = fxn*fxn1 ; 
    disp('incremental search for a root .... ')
    while(f_product > 0)
        fxn = fxn1;
        xn0 = xn0 + dx;
        fxn1 = fx_compute(xn0);
        f_product = fxn*fxn1 ; 
    end 

    disp('a root has been located !')

    if (f_product == 0)
        fprintf("root found (%f,%f) \n", xn0, fxn1)
    elseif(f_product < 0) %secant method
        
        disp('running secant method for precise root value')
        iterations = 0;
        
        xn1 = xn0+dx ; %*****
        
        while(1==1)
            fprintf('secant method iteration: %d\n',iterations);
            iterations = iterations + 1;
            
            xn2 = xn1 - (fx_compute(xn1) * (xn1-xn0))/(fx_compute(xn1) - fx_compute(xn0));
            
            if(abs(xn2-xn0) > epsi)
                xn0 = xn1; %*****
                xn1 = xn2; %*****
            else %approx root found
                fprintf("root found (%f,%f) \n", xn2, fx_compute(xn2))
                break;
            end
        end
    end
endfunction
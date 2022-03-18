function newton_first_order (fx_compute, fpx_compute, dx, epsi, xn0)
    xn1 = 0;
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
    elseif(f_product < 0) %newton method
        
        disp('running newton raphson method for precise root value')
        iterations = 0;
        while(1==1)
            fprintf('newton method iteration: %d\n',iterations);
            iterations = iterations + 1;
            xn1 = xn0 - fx_compute(xn0)/fpx_compute(xn0);
            if(abs(xn1-xn0) > epsi)
                xn0 = xn1;
            else %approx root found
                fprintf("root found (%f,%f) \n", xn1, fx_compute(xn1))
                break;
            end
        end
    end
endfunction
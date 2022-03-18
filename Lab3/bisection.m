function bisection (fx_compute, dx, epsi, xn0)
    xn1 = 0;
    xn12 = 0;

    xmax = input('xmax= ');
    iters = input('iterations= ');

    fxn = fx_compute(xn0);
    fxn1 = fxn;
    fxn12 = 0;

    %incremental search
    disp('incremental search for a root .... ')
    while(1==1) 
        
        xn0 = xn0 + dx; % x_n+1 = xn0 + dx
        fxn1 = fx_compute(xn0);
        f_product = fxn*fxn1 ; 

        if(f_product > 0 && xn0 > xmax)
            disp('No roots found ! extend x_max ? ')
            break; % Stop program
        elseif(f_product == 0)
            fprintf("root found (%f,%f)\n",xn0, fxn1)
            xn0 = xn0+ epsi;
            fxn = fx_compute(xn0); %update f(xi)
        elseif(f_product > 0)
            fxn = fxn1;            %update f(xi)
        elseif(f_product < 0) %run bisection method
            xn1 = xn0;
            xn0 = xn0 - dx;
            fprintf('a root has been located\n')
            disp('running bisection method for precise root value')
            iterations = 0;

            while(iterations <= iters)

                fprintf("bisection iteration: %d in range[%f, %f] \n", iterations ,xn0,xn1)

                xn12  =  0.5*(xn0 + xn1);
                fxn12 = fx_compute(xn12);

                f_product = fxn12*fxn;

                if(f_product == 0)
                    fprintf('root dound (%f,%f) \n',xn12,fxn12);
                    break;
                elseif(f_product > 0)
                    xn0 = xn12;
                    fxn = fxn12;
                else
                    xn1 = xn12;
                end
                iterations = iterations +1;
            end
            break; 
        end
    end 
endfunction
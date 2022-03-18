
function incremental (x_init, x_max, EPSI, dxi , fx_compute)
  
  xi  = x_init;
  finish_computations = 1;
  skip_Fx = -1;
  Fxi  = 0;
  Fxi_1  = 0;

  while (finish_computations == 1)

    if(skip_Fx != 1)
      Fxi = fx_compute(xi);
    end
    
    skip_Fx = -1;
    xi = xi + dxi;
    Fxi_1 = fx_compute(xi);

    %inifnity check
    temp = Fxi * Fxi_1;

    if(abs(Fxi_1) > 1/EPSI)
      disp("function approaching infinity...")
      xi = xi + dxi;
    else
      if( temp  >  0 )
        if (xi > x_max)
          finish_computations = -1;
          break;
        else
          Fxi = Fxi_1;
          skip_Fx = 1;
        end
      elseif ( temp == 0 || (temp < 0 && dxi < EPSI))
        fprintf("> %d is a root\n", xi)
        xi = xi + EPSI;
      else
        xi = xi  - dxi;
        dxi = 0.1 * dxi;
        skip_Fx = 1;
      end
    end
  end

endfunction

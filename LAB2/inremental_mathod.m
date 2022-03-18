
fx = @(xi) (1 + 5.25*xi - sec(sqrt(0.68*xi)));
fx_compute   = @(x) x.^7 + 9*x.^5 - 13*x -17;     % define the function f(x) 

dxi  = 0.1;
EPSI = 0.001;
x_max = 4;

incremental (0, x_max, EPSI, dxi, fx);
incremental (0, 2, EPSI, dxi, fx_compute);
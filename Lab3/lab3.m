fx_compute   = @(x) x.^7 + 9*x.^5 - 13*x -17;     % define the function f(x) 
fpx_compute  = @(x) 7*x.^6 + 45*x.^4 - 13;       % define first derivative of f(x)
fppx_compute = @(x) 42*x.^5 + 180*x.^3;         % define second derivative of f(x)

dx = input('dx= ');
epsi = input('epsi= ');
xn0 = input('x_init= ');

disp('================= first order newton method ==================')
newton_first_order(fx_compute, fpx_compute, dx, epsi, xn0)
disp('================= second order newton method =================')
newton_second_order(fx_compute, fpx_compute, fppx_compute, dx, epsi, xn0)
disp('======================== secant method =======================')
secant(fx_compute, dx, epsi, xn0)
disp('======================= bisection method =====================')
bisection(fx_compute, dx, epsi, xn0) 

# fx = @(x) x.**2 ;   
# fx = @(x) x.**5 ;   
fx = @(x) sin(x) ;   
X = 0:2*pi
Y = fx(X)
Order = length(X) -1

# lagrange(0.5, X, Y, Order)
lagrange(0.5, X, Y, 2)


%make a plot for visualization
hold on %draw plots on top of each other

%1- print samples
plot(X,Y, "*r;samples;","markersize", 10);

%2- print polinomials from order 1 to N in the range 1 to 5 with 0.1 steps

Xtemp = 0:0.1:Order;
Ytemp = Xtemp;

for o = 1:Order
    index = 1;
    for s = Xtemp 
        Ytemp(index) = lagrange(s, X, Y, o);
        index = index +1;
    endfor
    label = sprintf(";order %d;", o);
    plot(Xtemp,Ytemp,label);
endfor


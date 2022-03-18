A = [1 0 9 11 5];
size(A)

B = [1,0,9,4,3;0,8,4,2,7;14,90,0,43,25]
C = B(2,:)
D = [B(1,2),B(1,4);B(3,2),B(3,5)]

# Working with arrays
printf("******************** Working with arrays ****************\n");

A = [1 2 3; 4 5 6; 7 8 0];
B = [2 4 6; 0 3 7; 9 8 1];

printf(">> C = A+B\n");
C = A+B
printf(">> C = A-B\n");
C = A-B
printf(">> C = A*B\n");
C = A*B
printf(">> C = A/B\n");
C = A/B
printf(">> C = A\B\n");
C = A\B
printf(">> C = inv(A)*B\n");
C = inv(A)*B
printf(">> C = A./B\n");
C = A./B
printf(">> C = A.\B\n");
C = A.\B
printf(">> C = A.^B\n");
C = A.^B
printf(">> A_transpose = A'\n");
A_transpose = A'
printf(">> inv(A)\n");
inv(A)

#Eigen values and Eigen vectors
printf("*************** Eigen values and Eigen vectors ****************\n");

printf(">> [V,E]=eig(A) \n")
[V,E]=eig(A)
printf(">> E=eig(A) \n")
E=eig(A)


printf("************************** Format ***************\n");
w= 1.5707963267949
single(w)
format long e
format short e

# Building matrices
printf("******************** Building Matrices *************\n");
printf(">> eye(3) \n")
eye(3)
printf(">> zeros(2,4) \n")
zeros(2,4)
printf(">> ones(3) \n")
ones(3)
printf(">> [eye(2);zeros(2)] \n")
[eye(2);zeros(2)]
printf(">> [eye(2);ones(2,3)] \n")
[eye(2),ones(2,3)]

## Branching
printf("******************** Branching *************\n");
#if statement
if (A(1,1) > A(1,2))
    A(2,1) = 2.0*pi
end

if(sum(A(:,2)) > 10)
    A(1,1) = A(1,1) + B(1,1)
    A(2,1) = pi*A(2,1)
else 
    A(1,1) = A(1,1) + A(1,1)
    A(2,1) = pi*0.5
end

#example 1

nrows = 4;
ncols = 6;
A = ones(nrows,ncols)

for c = 1:ncols
    for r=1:nrows
        if r== c
            A(r,c) = 2;
        elseif abs(r-c)==1
            A(r,c) = -1;
        else 
            A(r,c) = 0;
        end
    end
end
A

#example 2
x = 10
minVal = 2;
maxVal = 6;

if (x>= minVal) && (x<= maxVal)
    disp('value within specified range.')
elseif (x)
    disp('value exceeds maximum value.')
else 
    disp('value is below minimum value.')
end 


disp('************************* For loops *********************************')
#example 1
for n = 1:length((A(1,:))) % in steps of 1 is the default
    xa(n) = A(1,n)^2;
    for m=1:2:length(xa)  %in steps of 2
        X(n,m) = n*m;
    end
end

X
xa


# -------------------------------------- in script file :p --------------------------
disp('example 2')
for a = 10:15
    fprintf('value of a %d\n', a);
end 

fprintf("\n\n")

disp('example 3')
for a = 1.0 : -0.1 : 0
    disp(a)
end 


fprintf("\n\n")

disp('example 4')
for a = [24,18,17,23,28]
    disp(a)
end

fprintf("\n\n")

disp('example 5')
k = 4;
for m=1:k
    for n=1:k
        if m == n 
            a(m,n)=2;
        elseif abs(m-n) == 2
            a(m,n)=1;
        else 
            a(m,n)=0;
        end
    end
end
a

disp('example 6: C = a+b')
# n = input('n=');
# m = input('m=');

# for i = 1:n
#     for j= 1:m
#         a(i,j) = input('matrix a by rows')
#     end
# end

# for i = 1:n
#     for j= 1:m
#         b(i,j) = input('matrix b by rows')
#     end
# end

# for i = 1:n
#     for j= 1:m
#         c(i,j) = a(i,j) + b(i,j);
#     end
# end
# c

# disp('example 7: C = a*b')
# n = input('n=');
# m = input('m=');
# d = input('d=');

# for i = 1:n
#     for j= 1:d
#         a(i,j) = input('matrix a by rows')
#     end
# end

# for i = 1:d
#     for j= 1:m
#         b(i,j) = input('matrix b by rows')
#     end
# end

# c = a*b

# for i = 1:n
#     for j= 1:m
#         c(i,j) = a(i,j) + b(i,j);
#     end
# end

disp('************************* While loops ****************************')
disp('example 1:')

count = 1;
num = 2;
while count < 16
    cnum = [count num];
    disp(cnum);
    num = num*2;
    count = count+1;
end

disp('************************* Break statement ****************************')
disp('example 1:')
count = 1;
num = 2;
while count < 16
    cnum = [count num];
    disp(cnum);
    num = num*2;
    count = count+1;
    if count >= 10 
        break
    end
end


disp('example 2:')
a = 10
while(a < 20)
    fprintf('value of a: %d\n', a);
    a = a+1;
    if (a > 15)
        break
    end
end



clc;
clear;

i = 1;
for x = -1:0.2:1
    y(1,i) = 1/(1 + 25*x^2);
    i = i + 1;
end
m = i - 1;
x = [-1:0.2:1];
NewtonTable = zeros(m, m + 1);
NewtonTable(:, 1) = x.'; 
NewtonTable(:, 2) = y.';

for j = 3:(m+1)
    for i = (j-1):m
        k = j - 2;
        New1 = NewtonTable(i, j-1) - NewtonTable(i-1, j-1);
        New2 = NewtonTable(i, 1) - NewtonTable(i-k, 1);
        NewtonTable(i, j) = New1/New2;
    end
end

NewtonTable
hold on;
PotX = NewtonTable(:, 1).';
PotY = NewtonTable(:, 2).';
scatter(PotX, PotY)

N1 = NewtonTable(1, 2);
N2 = NewtonTable(2, 3);
N3 = NewtonTable(3, 4);
N4 = NewtonTable(4, 5);
N5 = NewtonTable(5, 6);
N6 = NewtonTable(6, 7);
N7 = NewtonTable(7, 8);
N8 = NewtonTable(8, 9);
N9 = NewtonTable(9, 10);
N10 = NewtonTable(10, 11);
N11 = NewtonTable(11, 12);
X1 = NewtonTable(1, 1);
X2 = NewtonTable(2, 1);
X3 = NewtonTable(3, 1);
X4 = NewtonTable(4, 1);
X5 = NewtonTable(5, 1);
X6 = NewtonTable(6, 1);
X7 = NewtonTable(7, 1);
X8 = NewtonTable(8, 1);
X9 = NewtonTable(9, 1);
X10 = NewtonTable(10, 1);
InterA = NewtonTable(1, 1);
InterB = NewtonTable(m, 1);
i = 1;
iStep = 0.001; % 步长
for x = InterA:iStep:InterB
    yFun(1, i) = N1 + N2*(x-X1) ...
                    + N3*(x-X1)*(x-X2) ...
                    + N4*(x-X1)*(x-X2)*(x-X3) ...
                    + N5*(x-X1)*(x-X2)*(x-X3)*(x-X4) ...
                    + N6*(x-X1)*(x-X2)*(x-X3)*(x-X4)*(x-X5) ...
                    + N7*(x-X1)*(x-X2)*(x-X3)*(x-X4)*(x-X5)*(x-X6) ...
                    + N8*(x-X1)*(x-X2)*(x-X3)*(x-X4)*(x-X5)*(x-X6)*(x-X7) ...
                    + N9*(x-X1)*(x-X2)*(x-X3)*(x-X4)*(x-X5)*(x-X6)*(x-X7)*(x-X8) ...
                    + N10*(x-X1)*(x-X2)*(x-X3)*(x-X4)*(x-X5)*(x-X6)*(x-X7)*(x-X8)*(x-X9) ...
                    + N11*(x-X1)*(x-X2)*(x-X3)*(x-X4)*(x-X5)*(x-X6)*(x-X7)*(x-X8)*(x-X9)*(x-X10);% 函数
    i = i + 1;
end
x = [InterA:iStep:InterB];
plot(x, yFun);
hold off;
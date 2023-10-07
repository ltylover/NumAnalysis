clc;
clear;

% 牛顿多项式插值
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
InterpTable = NewtonTable(:, [1, 2]).';

for j = 3:(m+1)
    for i = (j-1):m
        k = j - 2;
        New1 = NewtonTable(i, j-1) - NewtonTable(i-1, j-1);
        New2 = NewtonTable(i, 1) - NewtonTable(i-k, 1);
        NewtonTable(i, j) = New1/New2;
    end
end
NewtonTable;

% 样条插值的准备工作
zeroArray = zeros(1, m);
InterpTable = [InterpTable; zeroArray];
for i = 1:m-1
    InterpTable(3, i) = InterpTable(1, (i+1)) - InterpTable(1, i);
end

InterpTable = [InterpTable; zeroArray];
for i = 1:m-1
    InterpTable(4, i) = (InterpTable(2, (i+1)) - InterpTable(2, i))/InterpTable(3, i);
end

% 自然边界条件的三次样条插值
natureTable = zeros(m);
for i = 1:m
    for j = 1:m
        if i == 1 && j == 1 || i == m && j == m
            natureTable(i, j) = 1;
        end
        if i ~= 1 && i ~= m
            switch j
                case i-1
                    natureTable(i, j) = InterpTable(3, i-1);
                case i
                    natureTable(i, j) = 2*(InterpTable(3, i-1) + InterpTable(3, i));
                case i+1
                    natureTable(i, j) = InterpTable(3, i+1);
            end
        end
    end
end

natureArray = zeros(m, 1);
for i = 2:m-1
    natureArray(i, 1) = 6*(InterpTable(4, i) - InterpTable(4, i-1));
end

mArray = zeros(m, 1);
mArray = natureTable^(-1)*natureArray;

zeroArray = zeros(4, m);
InterpTable = [InterpTable; zeroArray];
for j = 1:m-1
    InterpTable(5, j) = InterpTable(2, j);
    InterpTable(6, j) = InterpTable(4, j) - 0.5*mArray(j, 1)*InterpTable(3, j) ...
                                          - (mArray(j+1, 1)-mArray(j, 1))*InterpTable(3, j)/6;
    InterpTable(7, j) = mArray(j, 1)/2;
    InterpTable(8, j) = (mArray(j+1, 1)-mArray(j, 1))/(6*InterpTable(3, j));
end

%夹持边界条件的三次样条插值
clampTable = zeros(m);
for i = 1:m
    for j = 1:m
        if i == 1 && j == 1 
            clampTable(i, j) = 2*InterpTable(3, 1);
        elseif i == 1 && j == 2
            clampTable(i, j) = InterpTable(3, 1);
        elseif i == m && j == m-1
            clampTable(i, j) = InterpTable(3, m-1);
        elseif i == m && j == m
            clampTable(i, j) = 2*InterpTable(3, m-1);
        end
        if i ~= 1 && i ~= m
            switch j
                case i-1
                    clampTable(i, j) = InterpTable(3, i-1);
                case i
                    clampTable(i, j) = 2*(InterpTable(3, i-1) + InterpTable(3, i));
                case i+1
                    clampTable(i, j) = InterpTable(3, i+1);
            end
        end
    end
end

clampArray = zeros(m, 1);
for i = 2:m-1
    clampArray(i, 1) = 6*(InterpTable(4, i) - InterpTable(4, i-1));
end

mArray1 = zeros(m, 1);
mArray1 = clampTable^(-1)*clampArray;

zeroArray = zeros(4, m);
InterpTable = [InterpTable; zeroArray];
for j = 1:m-1
    InterpTable(9, j) = InterpTable(2, j);
    InterpTable(10, j) = InterpTable(4, j) - 0.5*mArray1(j, 1)*InterpTable(3, j) ...
                                          - (mArray1(j+1, 1)-mArray1(j, 1))*InterpTable(3, j)/6;
    InterpTable(11, j) = mArray1(j, 1)/2;
    InterpTable(12, j) = (mArray1(j+1, 1) - mArray1(j, 1))/(6*InterpTable(3, j));
end

% 绘图
hold on;

PotX = NewtonTable(:, 1).';
PotY = NewtonTable(:, 2).';
scatter(PotX, PotY);
plot(PotX, PotY, 'r');

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
plot(x, yFun, 'g');

stepNum = 1;
for i = 1:m-1 
    x_i = InterpTable(1, i);
    for x = InterpTable(1, i):iStep:InterpTable(1, i+1)
        natureInterFun(1, stepNum) = InterpTable(5, i) ...
                                     + InterpTable(6, i)*(x - x_i) ...
                                     + InterpTable(7, i)*(x - x_i)*(x - x_i) ...
                                     + InterpTable(8, i)*(x - x_i)*(x - x_i)*(x - x_i);
        stepNum = stepNum + 1;
    end
    stepNum = stepNum - 1;
end
x = [InterA:iStep:InterB];
plot(x, natureInterFun, 'b');

stepNum = 1;
for i = 1:m-1 
    x_i = InterpTable(1, i);
    for x = InterpTable(1, i):iStep:InterpTable(1, i+1)
        clampInterFun(1, stepNum) = InterpTable(9, i) ...
                                     + InterpTable(10, i)*(x - x_i) ...
                                     + InterpTable(11, i)*(x - x_i)*(x - x_i) ...
                                     + InterpTable(12, i)*(x - x_i)*(x - x_i)*(x - x_i);
        stepNum = stepNum + 1;
    end
    stepNum = stepNum - 1;
end
x = [InterA:iStep:InterB];
plot(x, clampInterFun, 'c');

hold off;
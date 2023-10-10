clc;
clear;

% 此处仅为多项式最小二乘法曲线拟合

dataTable = readtable('LeastSquaMeth.xlsx');
dataArray = table2array(dataTable);
LeastSquaTable = dataArray(:, :);
[m, n] = size(LeastSquaTable);

% 拟合函数为：y=a+b*x
% 2个未知数，故维度为2
dimen = 2;
% Amat*Cmat=Bmat, Cmat是由a和b系数组成的列向量
Amat = zeros(dimen);
Bmat = zeros(dimen, 1);

for i = 1:dimen
    for j = 1:dimen
        ySum = 0;
        for k = 1:n
            % i为维数，f为张成子空间中各多项式函数的次数
            switch i
                case 1
                    f = 0;
                case 2
                    f = 1;
%                 case 3
%                     f = 2;
%                 case 4
%                     f = 3;
            end
            % j为维数，g表示为张成子空间中各多项式函数的次数
            switch j
                case 1
                    g = 0;
                case 2
                    g = 1;
%                 case 3
%                     g = 2;
%                 case 4
%                     g = 3;
            end

            y = LeastSquaTable(1,k)^(f+g);
            ySum = ySum + y;

        end
        Amat(i, j) = ySum;
    end
end

for i = 1:dimen
    ySum = 0;
    for k = 1:n
        switch i
            case 1
                f = 0;
            case 2
                f = 1;
%             case 3
%                 f = 2;
%             case 4
%                 f = 3;
        end
        y = LeastSquaTable(1, k)^f*LeastSquaTable(2, k);
        ySum = ySum + y;
    end
    Bmat(i, 1) = ySum;
end

Cmat = Amat^(-1)*Bmat;

hold on;
PotX = LeastSquaTable(1, :);
PotY = LeastSquaTable(2, :);
scatter(PotX, PotY)

a = Cmat(1, 1);
b = Cmat(2, 1);
% c = Cmat(3, 1);
% d = Cmat(4, 1);
InterA = LeastSquaTable(1, 1);
InterB = LeastSquaTable(1, n);
i = 1;
iStep = 0.001; % 步长
for x = InterA:iStep:InterB
    yFun(1, i) = a + b*x;% 拟合的函数
    i = i + 1;
end
x = [InterA:iStep:InterB];
plot(x, yFun);
hold off;



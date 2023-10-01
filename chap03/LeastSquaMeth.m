clc;
clear;

dataTable = readtable('LeastSquaMeth.xlsx');
dataArray = table2array(dataTable);
LeastSquaTable = dataArray(:, :);
[m, n] = size(LeastSquaTable);

% 拟合函数为：a+b*x^2
% 2个未知数，故维度为2
dimen = 4;
Amat = zeros(dimen);
Bmat = zeros(dimen, 1);

for i = 1:dimen
    for j = 1:dimen
        ySum = 0;
        for k = 1:n

            switch i
                case 1
                    f = 0;
                case 2
                    f = 1;
                case 3
                    f = 2;
                case 4
                    f = 3;
            end

            switch j
                case 1
                    g = 0;
                case 2
                    g = 1;
                case 3
                    g = 2;
                case 4
                    g = 3;
            end
%             y = LeastSquaTable(1, i)^f*LeastSquaTable(1,k)^g;
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
            case 3
                f = 2;
            case 4
                f = 3;
        end
        y = LeastSquaTable(1, k)^f*LeastSquaTable(2, k);
        ySum = ySum + y;
    end
    Bmat(i, 1) = ySum;
end

Cmat = Amat^(-1)*Bmat;
% A = [1.178097245, 0, 1.570796327;
%     0,  1.570796327, 0;
%      1.570796327, 0, 3.141592654];
% B = [2;
%      2;
%      2];
% C = A^(-1)*B
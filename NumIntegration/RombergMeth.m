clc;
clear;

% y = exp(x)
a = 0; % 积分区间的下界
b = 1; % 积分区间的上界

RombergTable = zeros(4);

T_n = 0.5*(b - a)*(IntegrandFun(a) + IntegrandFun(b));
RombergTable(1, 1) = T_n;

i = 1;
j = 2;
n = 1; % 迭代计数器
err = 1;
while err > 0.00005 || n < 3

    i = 1;

    sum = 0;
    k = j - 1;
    for n = 0:2^(k-1)-1
        sum = sum + IntegrandFun(a + (2*n + 1)*(b - a)/2^k);
    end
    RombergTable(i, j) = 0.5*RombergTable(i, j-1) + (b - a)/2^k*sum;
    jFlag = 1;
    i = i + 1;
    j = j - 1;

    if i < 5 && j > 0
        RombergTable(i, j) = 4/3*RombergTable(i-1, j+1) - 1/3*RombergTable(i-1, j);
        i = i + 1;
        j = j - 1;
        jFlag = 3;
    end

    if i < 5 && j > 0
        RombergTable(i, j) = 16/15*RombergTable(i-1, j+1) - 1/15*RombergTable(i-1, j);
        i = i + 1;
        j = j - 1;
        jFlag = 4;
    end

    if i < 5 && j > 0
        RombergTable(i, j) = 64/63*RombergTable(i-1, j+1) - 1/63*RombergTable(i-1, j);
        i = i + 1;
        j = j - 1;
        jFlag = 5;
    end
    
    if n > 2
        err =  RombergTable(i-1, j+1) - RombergTable(i-2, j+1);
    end
    j = j + jFlag;
    n = n + 1;

end

j = j - jFlag + 1;
RombergInter = RombergTable(4, j);
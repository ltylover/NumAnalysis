clc;
clear;

%导入系数矩阵
dataTable1 = readtable('Mat01.xlsx');
dataArray1 = table2array(dataTable1);
A = dataArray1(:, :);

[X1] = GaussEliminMeth(A);
[X2] = GaussColuPrinElemEliminMeth(A);

%导入系数矩阵
dataTable2 = readtable('Mat02.xlsx');
dataArray2 = table2array(dataTable2);
B = dataArray2(:, :);

[X3] = GaussEliminMeth(B);
[X4] = GaussColuPrinElemEliminMeth(B);

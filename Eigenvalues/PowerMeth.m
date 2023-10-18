clc;
clear;

%导入矩阵
% dataTable1 = readtable('Mat01.xlsx');
% dataTable1 = readtable('Mat02.xlsx');
dataTable1 = readtable('Mat03.xlsx');
dataArray1 = table2array(dataTable1);
A = dataArray1(:, :);
[m, n] = size(A);

V_0 = [1; 1; 1];
% V_0 = [0; 0; 1];

err = 1;
k = 1;
Lambda_k = zeros(1);
V_kTable = zeros(3);
while err > 0.0005
    
    A_k = eye(m);
    if k > 1
        for i = 1:k
            A_k = A_k*A;
        end
        A_kV = A_k*V_0;
    
        A_1k = eye(m);
        for i = 1:k-1
            A_1k = A_1k*A;
        end
        A_1kV = A_1k*V_0;
        A_1kVabs = abs(A_1kV);
    
        V_k = A_kV/max(A_1kVabs);
    else
        V_k = A*V_0;
    end
    V_kTable([1 2 3], k) = V_k;
    Lambda_k(1, k) = max(V_k);

    if k > 1
        err = abs(Lambda_k(1, k) - Lambda_k(1, k-1));
    end
    k = k + 1;

end


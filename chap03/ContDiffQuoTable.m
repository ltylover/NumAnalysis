clc;
clear;

dataTable = readtable('ConQuoTable.xlsx');
dataArray = table2array(dataTable);
ConQuoTable = dataArray(:, :);
[m, n] = size(ConQuoTable);

for j = 3:n
    for i = (j-1):m

        Her1 = ConQuoTable(i, 1) - ConQuoTable(j-2, 1);
        Her2 = ConQuoTable(i, j-1) - ConQuoTable(j-2, j-1);
        ConQuoTable(i, j) = Her1/Her2;

    end
end

ConQuoTable







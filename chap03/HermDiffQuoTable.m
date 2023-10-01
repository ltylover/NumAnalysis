clc;
clear;

dataTable = readtable('HermiteTable.xlsx');
dataArray = table2array(dataTable);
Hermite = dataArray(:, :);
[m, n] = size(Hermite);


% Hermite = [2,   1.414214, 0,        0, 0, 0, 0, 0, 0;
%            2,   1.414214, 0.353553, 0, 0, 0, 0, 0, 0;
%            2.1, 1.449138, 0,        0, 0, 0, 0, 0, 0;
%            2.1, 1.449138, 0.345033, 0, 0, 0, 0, 0, 0;
%            2.2, 1.483240, 0,        0, 0, 0, 0, 0, 0;
%            2.2, 1.483240, 0.337100, 0, 0, 0, 0, 0, 0;
%            2.3, 1.516575, 0,        0, 0, 0, 0, 0, 0;
%            2.3, 1.516575, 0.329690, 0, 0, 0, 0, 0, 0];

for j = 3:n
    for i = (j-1):m

        k = j - 2;
        Her1 = Hermite(i, j-1) - Hermite(i-1, j-1);
        Her2 = Hermite(i, 1) - Hermite(i-k, 1);

        if Her2 ~= 0
            Hermite(i, j) = Her1/Her2;
        end

    end
end

Hermite

% H1 = Hermite(1, 2);
% H2 = Hermite(2, 3);
% H3 = Hermite(3, 4);
% H4 = Hermite(4, 5);
% H5 = Hermite(5, 6);
% H6 = Hermite(6, 7);
% H7 = Hermite(7, 8);
% H8 = Hermite(8, 9);
% 
% x = 2.15;
% Fun = H1 + H2*(x - 2) + H3*(x - 2)^2 + H4*(x - 2)^2*(x - 2.1) + H5*(x - 2)^2*(x - 2.1)^2 + H6*(x - 2)^2*(x - 2.1)^2*(x - 2.2) + H7*(x - 2)^2*(x - 2.1)^2*(x - 2.2)^2 + H8*(x - 2)^2*(x - 2.1)^2*(x - 2.2)^2*(x - 2.3);     





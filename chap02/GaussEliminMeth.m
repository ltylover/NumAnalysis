function [X] = GaussEliminMeth(A)
    [m, n] = size(A);
    X = zeros(m, 1);

    %化为上三角矩阵
    for i = 1 : (m - 1)
        for j = i : (m - 1)
            a_i = A(i, i);
            a_j = A(j + 1, i);
            k = a_j/a_i;
            A(j + 1, :) = A(j + 1, :) - k*A(i, :);
        end
    end
    
    %化为对角矩阵
    for i = m : -1 : 2
        for j = i : -1 : 2
            a_i = A(i, i);
            a_j = A(j - 1, i);
            k = a_j/a_i;
            A(j - 1, :) = A(j - 1, :) - k*A(i, :);
        end
    end
    
    %提取解
    for i = 1 : m
        X(i, 1) = A(i, n)/A(i, i);
    end

end
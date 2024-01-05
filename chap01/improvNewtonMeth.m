function [x_k1, err] = improvNewtonMeth(x_k)

    xFun = 2*x_k^3 - 5*x_k^2 + 4*x_k - 1;
    xdFun = 6*x_k^2 - 10*x_k + 4;

    x_k1 = x_k - 2*xFun/xdFun;

    err = abs(x_k1 - x_k);

end
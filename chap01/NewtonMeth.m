function [x_k1, err] = NewtonMeth(x_k)
%     xFun = x_k*exp(x_k) - 1;
%     xdFun = (x_k + 1)*exp(x_k);

%     xFun = x_k^3 - x_k + 1;
%     xdFun = 3*x_k^2 - 1;

    xFun = 2*x_k^3 - 5*x_k^2 + 4*x_k - 1;
    xdFun = 6*x_k^2 - 10*x_k + 4;

    x_k1 = x_k - xFun/xdFun;

    err = abs(x_k1 - x_k);

end
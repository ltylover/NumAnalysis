function [x_k1, x_k2, err] = SecantMeth(x_k, x_k1)

    xkFun = x_k*exp(x_k) - 1;
    xk1Fun = x_k1*exp(x_k1) - 1;

    x_k2 = x_k1 - xk1Fun*(x_k1 - x_k)/(xk1Fun - xkFun);

    err = abs(x_k2 - x_k1);

end
clc;
clear;

x_k = 0.4;
x_k1 = 0.6;
iStep = 0;

err = 1;
while err > 0.000005

    [x_k1, x_k2, err] = SecantMeth(x_k, x_k1);

    x_k = x_k1;
    x_k1 = x_k2;
    iStep = iStep + 1;
end
 
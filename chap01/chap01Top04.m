clc;
clear;

x_k = 0.55;
iStep = 0;

err = 1;
while err > 0.000005
    [x_k1, err] = improvNewtonMeth(x_k);
    x_k = x_k1;
    iStep = iStep + 1;
end
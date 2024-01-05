clc;
clear;

% y' = x + y

h = 0.2;
% h = 0.1;
a = 0;
b = 1;
xArray = 0;
yArray = 0.6;
k = 2;
for i = a+h:h:b
    x_n = xArray(1, k-1);
    y_n = yArray(1, k-1);
    k1 = xyFun(x_n, y_n);
    k2 = xyFun(x_n + 0.5*h, y_n + 0.5*h*k1);
    k3 = xyFun(x_n + 0.5*h, y_n + 0.5*h*k2);
    k4 = xyFun(x_n + h, y_n + h*k3);
    yArray(1, k) = y_n + 1/6*h*(k1 + 2*k2 + 2*k3 + k4);
    xArray(1, k) = i;
    k = k + 1;
end

hold on
plot(xArray, yArray);
hold off
clc;
clear;

% f(x, y) = x + y

h = 0.2;
a = 0;
b = 1;
xArray = 0;
yArray = 1;
k = 2;
for i = a+h:h:b
    x_n = xArray(1, k-1);
    y_n = yArray(1, k-1);
    xyf_n = xyFun(x_n, y_n);
    yArray(1, k) = y_n + 0.5*h*(xyf_n + xyFun(x_n + h, y_n + h*xyf_n));
    xArray(1, k) = i;
    k = k + 1;
end

hold on
plot(xArray, yArray);
hold off
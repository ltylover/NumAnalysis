clc;
clear;

X1 = 1.0;
X2 = 1.0;
X3 = 1.0;

X_k = [X1; 
       X2;
       X3];

dF = [X2,           X1,           -2*X3;
      X2*X3 - 2*X1, X1*X3 + 2*X2, X1*X2;
      exp(X1),      -exp(X2),     1];

B_k = (dF)^(-1);

err = 1;
iStep = 0;

% while iStep <1
while err > 0.000005

    [X_k1, B_k1, err] = QuaNewtonMeth(X_k, B_k);
    X_k = X_k1;
    B_k = B_k1;
    iStep = iStep + 1;

end

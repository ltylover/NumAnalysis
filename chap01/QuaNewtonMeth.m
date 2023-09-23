function [X_k1, B_k1, err] = QuaNewtonMeth(X_k, B_k)

    X1 = X_k(1,1);
    X2 = X_k(2,1);
    X3 = X_k(3,1);

    Fun_k_1 = X1*X2 - X3^2 - 1;
    Fun_k_2 = X1*X2*X3 + X2^2 -X1^2 -2;
    Fun_k_3 = exp(X1) + X3 - exp(X2) - 3;

    Fun_k = [Fun_k_1;
             Fun_k_2;
             Fun_k_3];
   
    X_k1 = X_k - B_k*Fun_k;

    X11 = X_k1(1,1);
    X22 = X_k1(2,1);
    X33 = X_k1(3,1);
    
    Fun_k1_1 = X11*X22 - X33^2 - 1;
    Fun_k1_2 = X11*X22*X33 + X22^2 -X11^2 -2;
    Fun_k1_3 = exp(X11) + X33 - exp(X22) - 3;
    Fun_k1 = [Fun_k1_1;
             Fun_k1_2;
             Fun_k1_3];

    R_k = X_k1 - X_k;
    Y_K = Fun_k1 - Fun_k;
    U_k = R_k - B_k*Y_K;
    U_kT = U_k.';
    V_k = U_k/(U_kT*Y_K);
    B_k1 = B_k + V_k*U_kT;

    %逐个比较X向量的各元素的差，取最大值作为误差
%     err = max(abs(X11-X1), abs(X22-X2));
%     err = max(err, abs(X33-X3));

    %取X向量的差的无穷范数作为误差
    errMat = X_k1 - X_k;
    err = norm(errMat, "inf");
end

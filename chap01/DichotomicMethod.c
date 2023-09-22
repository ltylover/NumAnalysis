#include<stdio.h>
#include<stdlib.h>
#include<math.h>

double xFun(double x)
{
    double xFunction = sin(x) - x*x/2;
    return xFunction;
}

int main()
{
    double a = 1;
    double b = 2;
    double x = (a + b)/2;
    int flag = 0;

    while ((b - a) >= 0.000005)
    {
        x = (a + b)/2;

        if (xFun(x) == 0)
        {
            flag = 1;
            break;
        }

        if (xFun(a)*xFun(b) > 0)
        {
            a = x;
        }
        else
        {
            b = x;
        }

    }
    
    if (flag == 1)
    {
        printf("答案是%f", x);
    }
    else
    {
        x = (a + b)/2;
        printf("估计区间是[%f,%f],估计结果是%f", a, b, x);
    }

}
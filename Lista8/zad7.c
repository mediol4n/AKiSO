#include <stdio.h>

extern float my_ln(float);
extern float my_e_to(float);
extern float my_sinh(float);
extern float my_sinhm1(float);

int main()
{
	printf("%f\n", my_ln(3.14));
	printf("%f\n", my_e_to(3.14));
	printf("%f\n", my_sinh(3.14));
	printf("%f\n", my_sinhm1(3.14));
}

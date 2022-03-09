#include <stdio.h>
#include<stdint.h>

extern int32_t comparaison(void);

int main(void) {
	int32_t a = comparaison();
	if (a==0) printf("String1 est egale que String2\n");
	if (a==1) printf("String1 est plus grand que String2\n");
	if (a==255) printf("String1 est plus petit que String2\n");
	return 0;
}

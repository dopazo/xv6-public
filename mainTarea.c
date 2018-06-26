#include "types.h"
#include "stat.h"
#include "user.h"

int main(void){
	printf(1,"Memoria fisica del proceso: %x \n",getPhysicalAddress()); //x para hexadecimales
	exit();
}

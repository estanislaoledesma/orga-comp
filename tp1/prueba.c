#include <stdio.h>

typedef struct hola
{
	int a;
	int b;
	int c;
	int d;
	int e;
	int f;
	int g;
	int h;
	int i;
	int j;
	int k;
	int l;
}hola_t;

void hola_mundo(hola_t* params){
	float uno = 10;
	size_t dos = 20;
	unsigned tres = 30;
	params->a = 3;
	params->e = params->f + params->g;
	printf("Hola\n");
}

int main(int argc, char const *argv[])
{
	hola_t params;
	params.a = 1;
	params.b = 1;
	params.c = 1;
	params.d = 1;
	params.e = 1;
	params.f = 1;
	params.g = 1;
	
	
	hola_mundo(&params);
	return 0;
}
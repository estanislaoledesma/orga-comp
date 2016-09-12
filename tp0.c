
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <unistd.h>
#include <getopt.h>
#define N 255

typedef struct complejo{
	float parteReal;
	float parteImaginaria;
}complejo;

void multComplejos(complejo* z1, complejo* z2){
	//Multiplica dos complejos. El resultado pisa el valor del primer argumento.
	complejo temp;
	temp.parteReal = ((z1->parteReal)*(z2->parteReal))-((z1->parteImaginaria)*(z2->parteImaginaria));
	temp.parteImaginaria = ((z1->parteImaginaria)*(z2->parteReal))+((z1->parteReal)*(z2->parteImaginaria));
	z1->parteReal = temp.parteReal;
	z1->parteImaginaria = temp.parteImaginaria;
}

void sumaComplejos(complejo* z1, complejo* z2){
	//Suma dos complejos. El resultado pisa el valor del primer argumento.
	z1->parteReal = ((z1->parteReal)+(z2->parteReal));
	z1->parteImaginaria = ((z1->parteImaginaria)+(z2->parteImaginaria));
}

void imprimirComplejo(complejo* z){
	//Imprime por pantalla un complejo en forma binomica.
	if (z->parteImaginaria < 0){
		printf("%f%fi",z->parteReal,z->parteImaginaria);
	} else {
		printf("%f+%fi",z->parteReal,z->parteImaginaria);
	}
}

float valorAbsoluto(complejo* z){
	if (z == NULL) return -1;
	return sqrtf((float)pow(z->parteReal,2)+(float)pow(z->parteImaginaria,2));
}

void print_usage() {
    printf("Usage: \n -r 640x480\n -c 0+0i\n -C 0.285-0,01i\n -w 4\n -H 4\n -o /home/julia.pgm\n  (or -o - for stdout)\n");
}


int main(int argc, char * const argv[]){
	const char* pathToExe;
	int option = -1;
	int encontroRes = -1;
	int encontroAlto = -1;
	int encontroAncho = -1;
	int encontroConst = -1;
	int encontroOutput = -1;
	int encontroOrigen = -1;
	int salidaConsola = -1;
	char* ptrOrigen;
	char* constante;
	char* output;
	char* res;
	char controli;
	


	pathToExe = argv[0];
	int resolucionHorizontal, resolucionVertical;
	float anchoRectangulo;
	float altoRectangulo;

	while ((option = getopt(argc, argv,"r:c:C:W:H:o:")) != -1) {
	switch (option) {
		case 'r' : 
			encontroRes = 1;
			res = optarg;
			break;
		case 'c' : 
			encontroOrigen = 1;
			ptrOrigen = optarg;
			break;
		case 'C' : 
			encontroConst = 1;
			constante = optarg; 
			break;
		case 'W' : 
			anchoRectangulo = atoi(optarg);
			encontroAncho = 1;
			break;
		case 'H' : 
			altoRectangulo = atoi(optarg);
			encontroAlto = 1;
			break;
		case 'o' : 
			encontroOutput = 1;
			if ((isalpha((char)optarg[0]) != 1) && (isdigit((char)optarg[0]) != 1)){
				if (strcmp(optarg, "-") == 0) salidaConsola = 1;
				else {
					printf("fatal: cannot open output file.\n");
					exit(0);
				}
			}
			output = optarg;
			break;
		default: print_usage(); 
			exit(EXIT_FAILURE);
		}
	}

	if (encontroOutput != 1){   ///UNICA CONDICION NECESARIA PARA CORRER EL PROGRAMA
		print_usage();
		printf("El argumento -o es condición necesaria\n");
		return -1;
	} else {
	}

	complejo constanteC;

	complejo origen;

	complejo pixel;

	complejo pixelPolinomio;
	


	if (encontroAlto == 1){
	} else {
		altoRectangulo = 4;
	}

	if (encontroAncho == 1){
	} else {
		anchoRectangulo = 4;
	}

	if (encontroConst == 1){

		int i;
		i = sscanf(constante, "%f%f%c", &constanteC.parteReal, &constanteC.parteImaginaria, &controli);
		if (i < 3){
			print_usage();
			exit(0);
		}
	} else {
		constanteC.parteReal = 0.285;
		constanteC.parteImaginaria = -0.01;
	}

	if (encontroOrigen == 1){

		int i;
		i = sscanf(ptrOrigen, "%f%f%c", &origen.parteReal, &origen.parteImaginaria, &controli);
		if (i < 3){
			print_usage();
			exit(0);
		}
	} else {
		origen.parteReal = 0;
		origen.parteImaginaria = 0;	
	}

	if (encontroRes == 1){
    	int resVal;
    	resVal = sscanf(res, "%dx%d", &resolucionHorizontal, &resolucionVertical);
    	if (resVal < 2 || resolucionVertical == 0 || resolucionHorizontal == 0)
    	{
    		print_usage();
    		exit(0);
    	}
	} else {
		resolucionHorizontal = 640;
		resolucionVertical = 480;
	}


	float pasoHorizontal = ((anchoRectangulo) / (float)(resolucionHorizontal))/2;
	float pasoVertical = ((altoRectangulo) / (float)(resolucionVertical))/2;
	int brillo[resolucionHorizontal][resolucionVertical];
	int contadorBrillo;

	FILE *fp;
	fp=fopen(output, "w");
	if(fp == NULL) return 1;

	fprintf(fp, "P2 \n%d %d \n255 \n", resolucionHorizontal, resolucionVertical);

	for (int y = 1; y <= resolucionVertical; y++){
		for (int x = 1; x <= resolucionHorizontal; x++){
			pixel.parteReal = pasoHorizontal * (2 * x -1) - anchoRectangulo / 2 + origen.parteReal;
			pixel.parteImaginaria = -pasoVertical * (2 * y -1) + altoRectangulo / 2 + origen.parteImaginaria;

			for (contadorBrillo = 0; contadorBrillo <= N; contadorBrillo++){
				if (valorAbsoluto(&pixel) > 2) break;

				multComplejos(&pixel, &pixel);
				sumaComplejos(&pixel, &constanteC);


			}
			fprintf(fp, "%d ", contadorBrillo );
		}
		fprintf(fp, "\n");
	}
	rewind(fp);
	fclose(fp);

	if (salidaConsola == 1){

		fp=fopen(output, "rb+");
		if(fp == NULL) return 1;
		int c;
		
		while((c=fgetc(fp)) != EOF){
        	printf( "%c", c );
    	}

    	 fclose(fp);
    	 remove(output);
	}
	return 0;
}


#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <unistd.h>
#define N 255

typedef struct complejo{
	float parteReal;
	float parteImaginaria;
}complejo;

//z*w = (a + bi)*(c + di) = (ac-bd) + (ad+bc)i

// c.real = a.real*b.real - a.img*b.img;
// c.img = a.img*b.real + a.real*b.img;

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
    printf("Usage: -r640x480 -c0+0i -C0.285-0,01i -W4 -H4 -o/home/julia.pgm\n");
}

int parsearComplejo(complejo* z, char* strComplejo){
	int i = 1;
	int encontroSignoComplejo = 0;
	char signoReal, signoComplejo;
	int indiceSignoComplejo;
	signoReal = strComplejo[0];
	while (encontroSignoComplejo != 1){
		if (!isdigit(strComplejo[i])){
			encontroSignoComplejo = 1;
			indiceSignoComplejo = i;
			signoComplejo = strComplejo[i];
		}
		i++;
	}

	///printf("SIGNOCOMPLEJO %c\n", signoComplejo);
	///printf("SIGNOREAL %c\n", signoReal);
	char * pch;
	pch = strtok(strComplejo + 1, &signoComplejo);
	///printf("CAMPOREAL %s\n", pch);
	z->parteReal = atoi(pch);
	pch = strtok(strComplejo + indiceSignoComplejo + 1, "i");
	z->parteImaginaria = atoi(pch);
	if (signoReal == '-'){
		z->parteReal = z->parteReal * -1;
	}
	if (signoComplejo == '-'){
		z->parteImaginaria = z->parteImaginaria * -1;
	}
	//printf("CAMPOIM %s\n", pch);
/*
		resolucionHorizontal = atoi(pch);
    	pch = strtok (NULL, "x");
    	resolucionVertical = atoi(pch);*/

	return 0;
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
	

	/*
	complejo* unComplejo = malloc(sizeof(complejo));
	char complejoStr[] = "+202-5i";
	int res = parsearComplejo(unComplejo, complejoStr);
	imprimirComplejo(unComplejo);
	free (unComplejo);
	return 0;*/

//-r640x480 -c0+0i -C0.285-0,01i -W4 -H4 -o-
//-r640x480 -c0+0i -C0.285-0,01i -W4 -H4 -o/home/julia.pgm
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
			if (strcmp(optarg, "-") == 0) salidaConsola = 1;
			output = optarg;
			break;
		default: print_usage(); 
			exit(EXIT_FAILURE);
		}
	}

	if (encontroOutput != 1){   ///UNICA CONDICION NECESARIA PARA CORRER EL PROGRAMA
		printf("Falta especificar el parametro -o\n");
		printf("-o /home/desktop/imagen.pgm\n");
		printf("-o - (para salida standard)\n");
		return -1;
	} else {
	}

	complejo* constanteC = malloc(sizeof(complejo));
	if (constanteC == NULL){
		free(constanteC);
		return 1;
	}

	complejo* origen = malloc(sizeof(complejo));
	if (origen == NULL){
		free(origen);
		free(constanteC);
		return 1;
	}

	complejo* pixel = malloc(sizeof(complejo));
	if (pixel == NULL){
		free(pixel);
		free(origen);
		free(constanteC);
		return 1;
	}

	complejo* pixelPolinomio = malloc(sizeof(complejo));
	if (pixelPolinomio == NULL){
		free(pixelPolinomio);
		free(pixel);
		free(origen);
		free(constanteC);
	return 1;
	}


	if (encontroAlto == 1){
	} else {
		altoRectangulo = 4;
		//altoRectangulo = 0.5;
	}

	if (encontroAncho == 1){
	} else {
		anchoRectangulo = 4;
		//anchoRectangulo = 0.5;
	}

	if (encontroConst == 1){
		if (parsearComplejo(constanteC, constante) !=0){
			printf("Error obteniendo la constante compleja.\n");
			print_usage();
			return -1;
		}
	} else {
		constanteC->parteReal = 0.285;
		constanteC->parteImaginaria = -0.01;
	}

	if (encontroOrigen == 1){
		if (parsearComplejo(origen, ptrOrigen) != 0){
			printf("Error obteniendo el origen complejo.\n");
			print_usage();
			return -1;
		}
	} else {
		//va 0 0
		origen->parteReal = 0;
		origen->parteImaginaria = 0;	
	}

	if (encontroRes == 1){
		char * pch;
		pch = strtok(res, "x");
		resolucionHorizontal = atoi(pch);
    	pch = strtok (NULL, "x");
    	resolucionVertical = atoi(pch);
	} else {
		resolucionHorizontal = 640;
		resolucionVertical = 480;
	}

	printf("Verificacion parametros: \n");
	printf("Alto: %f, ancho: %f, altoR: %d, anchoR: %d \n", altoRectangulo, anchoRectangulo, resolucionVertical, resolucionHorizontal);
	printf("Origen: ");
	imprimirComplejo(origen);
	printf("\nConstante: ");
	imprimirComplejo(constanteC);
	printf("\n\n");


	float extremoIzq = origen->parteReal - ((anchoRectangulo) / 2);
	float extremoSup = origen->parteImaginaria + ((altoRectangulo) / 2);

	float pasoHorizontal = (anchoRectangulo) / (float)(resolucionHorizontal);
	float pasoVertical = (altoRectangulo) / (float)(resolucionVertical);
	int brillo[resolucionHorizontal][resolucionVertical];
	int corte = 256;
	int contadorCorte = 0;

	for (int y = 0; y < resolucionVertical; y++){
		for (int x = 0; x < resolucionHorizontal; x++){
			pixel->parteReal = extremoIzq + (pasoHorizontal/2) + (x * pasoHorizontal);
			pixel->parteImaginaria = extremoSup - (pasoHorizontal/2) - (y * pasoVertical);

			while ((contadorCorte < corte) && (valorAbsoluto(pixel) < 2)){
				multComplejos(pixel, pixel);
				sumaComplejos(pixel, constanteC);
				contadorCorte++;
			}
			brillo[x][y] = contadorCorte;
			if (x == 0 || y == 0 || x == resolucionHorizontal - 1 || y == resolucionVertical -1){
				brillo[x][y] = 255;
			}
			contadorCorte = 0;
		}
	}

	FILE *fp;
	fp=fopen(output, "wb");
	if(fp == NULL) return 1;

	fprintf(fp, "P2\n");
	fprintf(fp, "%d %d\n", resolucionHorizontal, resolucionVertical);
	fprintf(fp, "255\n");

	for (int y = 0; y < resolucionVertical; y++){
		for (int x = 0; x < resolucionHorizontal; x++){
			fprintf(fp, "%d ",brillo[x][y]);
		}
		fprintf(fp, "\n");
	}
	fclose(fp);

	if (salidaConsola == 1){
		fp=fopen(output, "rt");
		char c;
		while((c=fgetc(fp)) !=EOF){
        	printf("%c",c);
    	}

    	 fclose(fp);
    	 remove(output);
	}
	return 0;
}

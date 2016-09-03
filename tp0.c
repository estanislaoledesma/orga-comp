#include <string.h>
#include <stdio.h>

#define N 10


typedef struct complejo{
	float parteReal;
	float parteImaginaria;
}complejo;

int main(int argc, const char* argv[]){
	/* Validar parámetros y crear archivo PGM de salida */
	char* archivoSalida = NULL;
	char* resolucion = "640x480";
	char* anchoRectangulo = "4";
	char* altoRectangulo = "4";
	char* centro = "0+0i";
	char* c = "0,285−0,01i";
	if (argc < 3){
		return 1;
	}
	for (int i = 1; i < argc; i++){
		if((i + 1) < argc){
			return 1;
		}
		if (strcmp(argv [i], "-r") == 0){
			resolucion = argv [i + 1];
		}
		if (strcmp(argv [i], "-c") == 0){
			centro = argv [i + 1];
		}
		if (strcmp(argv [i], "-C") == 0){
			c = argv [i + 1];
		}
		if (strcmp(argv [i], "-w") == 0){
			anchoRectangulo = argv [i + 1];
		}
		if (strcmp(argv [i], "-H") == 0){
			altoRectangulo = argv [i + 1];
		}
		if (strcmp(argv [i], "-r") == 0){
			archivoSalida = argv [i + 1];
		}
		else{
			return 1;
		}

	}
	int anchoResolucion, altoResolucion, anchoRectangulo, altoRectangulo;
	complejo* centro, c;
	complejo* origen = malloc(sizeof(complejo));
	if (origen == NULL){
		free(centro);
		free(c);
		return 1
	}
	origen->parteReal = centro->parteReal - float(anchoRectangulo) / 2;
	origen->parteImaginaria = centro->parteImaginaria - float(altoRectangulo) / 2;
	float pasoHorizontal = float(anchoRectangulo) / float(anchoResolucion);
	float pasoVertical = float(altoRectangulo) / float(altoResolucion);
	float extremoReal = origen->parteReal + anchoRectangulo;
	float extremoImaginario = origen->parteImaginaria + altoRectangulo;
	for (float ejeReal = origen->parteReal; ejeReal <= extremoReal; ejeReal += pasoHorizontal){
		for (float ejeImaginario = origen->parteImaginaria; ejeImaginario <= extremoImaginario; ejeImaginario += pasoVertical){
			complejo* puntoPixel = malloc(sizeof(complejo));
			if (puntoPixel == NULL){
				free(centro);
				free(c);
				free(origen);
				return 1;
			}
			puntoPixel->parteReal = ejeReal;
			puntoPixel->parteImaginaria = ejeImaginario;
			int i = 0;
			for (i; i < N - 1; ++i){
				if ((puntoPixel->parteReal * puntoPixel->parteReal + puntoPixel->parteImaginaria * puntoPixel->parteImaginaria) < 4){
					break;
				}
				float parteReal = (puntoPixel->parteReal * puntoPixel->parteReal - puntoPixel->parteImaginaria * puntoPixel->parteImaginaria) + c->parteReal;
				puntoPixel->parteImaginaria = puntoPixel->parteReal * puntoPixel->parteImaginaria * 2 + c->parteImaginaria;
				puntoPixel->parteReal = parteReal;
			}
			/* Agregar brillo de pixel (i) al archivo de PGM de salida */
			free(puntoPixel);
		}
	}
	free(centro);
	free(c);
	free(origen);
	return 0;
}
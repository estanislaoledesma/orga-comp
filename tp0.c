#define N 10


typedef struct complejo{
	float parteReal;
	float parteImaginaria;
}complejo;

int main(int argc, char* argv[]){
	/* Validar parámetros y crear archivo PGM de salida */
	char* archivoSalida;
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
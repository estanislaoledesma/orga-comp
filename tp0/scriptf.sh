clear
echo ///
echo ///       Martes 13 de Septiembre de 2016
echo ///       TP0 - Martin Queija - Estanislao - Agustin
echo ///
echo
echo Compilando... -std=c99 tp0f.c -o tp0 -lm
gcc -std=c99 tp0f.c -o tp0 -lm
echo Ejecutando Pruebas...
echo
echo 1- Test positivo: genera imagen con nombre JuliaSet.pgm
echo en la carpeta del ejectuable con los valores por defecto
echo ./tp0 -o juliaSet.pgm
./tp0 -o juliaSet.pgm
echo 
echo 
echo 2- Test positivo: con los parametros pasados deberia
echo imprimir por pantalla el valor 19
echo ./tp0 -c 0.01+0i -r 1x1 -o -
./tp0 -c 0.01+0i -r 1x1 -o -
echo
echo 
echo 3- Test positivo: con los parametros pasados deberia
echo imprimir por ppantalla el valor 0
echo ./tp0 -c 10+0i -r 1x1 -o -
./tp0 -c 10+0i -r 1x1 -o -
echo
echo 
echo 4- Test negativo: se especifica una resolucion de valor 0
echo ./tp0 -c 0+0i -r 0x1 -o -
./tp0 -c 0+0i -r 0x1 -o -
echo
echo 
echo 5- Test negativo: se especifica una ruta de archivo invalida
echo ./tp0 -o /tmp
./tp0 -o /tmp
echo
echo 
echo 6- Test negativo: se especifica un tamanio del plano complejo invalido
echo ./tp0 -o juliaSet.pgm -W -2 -H 0
./tp0 -o juliaSet.pgm -W -2 -H 0
echo
echo 
echo 7- Test negativo: se especifica un valor complejo incorrecto
echo ./tp0 -c 1+3 -o -
./tp0 -c 1+3 -o -
echo
echo 
echo 8- Test negativo: se especifica un complejo vacio
echo ./tp0 -c "" -o -
./tp0 -c "" -o -
echo

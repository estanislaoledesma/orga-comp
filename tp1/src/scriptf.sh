clear
echo ///
echo ///       
echo ///       TP1 - Martin Queija - Estanislao - Agustin
echo ///
echo
echo Compilando... 
make clean
make makefiles
make
echo Ejecutando Pruebas...
echo
echo Test 1: genera imagen con nombre JuliaSet.pgm
echo con los valores por defecto
echo ./tp1 -o juliaSet.pgm
./tp1 -o test/asm/test1.pgm
diff -q test/asm/test1.pgm test/c/caso1.pgm
echo 
echo 
echo Test 2:
echo ./tp1 -c 0.01+0i -r 1x1 -o test/asm/test2.pgm
./tp1 -c 0.01+0i -r 1x1 -o test/asm/test2.pgm
diff -q test/asm/test2.pgm test/c/caso2.pgm
echo
echo 
echo Test 3:
echo ./tp1 -c 10+0i -r 1x1 -o test/asm/test3.pgm
./tp1 -c 10+0i -r 1x1 -o test/asm/test3.pgm
diff -q test/asm/test3.pgm test/c/caso3.pgm
echo
echo 
echo Test 4:
echo ./tp1 -C 10+5i -r 10x10 -o test/asm/test4.pgm
./tp1 -C 10+5i -r 10x10 -o test/asm/test4.pgm
diff -q test/asm/test4.pgm test/c/caso4.pgm
echo
echo 
echo Test 5:
echo ./tp1 -H 300 -w 150  -o test/asm/test5.pgm
./tp1 -H 300 -w 150  -o test/asm/test5.pgm
diff -q test/asm/test5.pgm test/c/caso5.pgm
echo
echo 
echo Test 6: se especifica una resolucion de valor 0
echo ./tp1 -c 0+0i -r 0x1 -o -
./tp1 -c 0+0i -r 0x1 -o -
echo
echo 
echo Test 7: se especifica una ruta de archivo invalida
echo ./tp1 -o /tmp
./tp1 -o /tmp
echo
echo 
echo Test 8: se especifica un tamanio del plano complejo invalido
echo ./tp1 -o juliaSet.pgm -W -2 -H 0
./tp1 -o juliaSet.pgm -W -2 -H 0
echo
echo 
echo Test 9: se especifica un valor complejo incorrecto
echo ./tp1 -c 1+3 -o -
./tp1 -c 1+3 -o -
echo
echo 
echo Test 10: se especifica un complejo vacio
echo ./tp1 -c "" -o -
./tp1 -c "" -o -
echo

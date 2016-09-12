#!/bin/bash
echo
echo Compilando...
echo
gcc -std=c99 tp0.c -o tp0 -lm

echo Ejecutando...
echo

echo ./tp0 -o -i
./tp0 -o -i
echo 
echo ./tp0 -c 0.01+0i -r 1x1 -o -
./tp0 -c 0.01+0i -r 1x1 -o -
echo
echo ./tp0 -c 10+0i -r 1x1 -o -
./tp0 -c 10+0i -r 1x1 -o -
echo
echo ./tp0 -c 0+0i -r 0x1 -o -
./tp0 -c 0+0i -r 0x1 -o -
echo
echo ./tp0 -o /tmp
./tp0 -o /tmp
echo
echo ./tp0 -c 1+3 -o -
./tp0 -c 1+3 -o -
echo
echo ./tp0 -c "" -o -
./tp0 -c "" -o -
echo
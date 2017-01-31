#!/bin/bash 
lex analizador.lex
gcc lex.yy.c -o prog -ll
./prog < contam.fastq > out

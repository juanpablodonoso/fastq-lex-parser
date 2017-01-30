#!/bin/bash 
lex ejemplo.lex
gcc lex.yy.c -o prog -ll
./prog < contam.fastq > salida 

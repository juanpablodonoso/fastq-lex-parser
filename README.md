# lex-amples
LEX parser for Bioinformatics FASTQ format. 
Biologist and bioinformatician please don't enter here. 

For use: 
Prerequisites:
```
sudo apt install flex
```
Compile LEX with: 
```
lex analizador.lex
gcc lex.yy.c -o prog -ll
./prog < contam.fastq > out
```

car         [a-zA-Z]
A           [A]
C           [C]
G           [G]
T           [T]
R           [R]
inicioDes   [@]
separador   [:]
mas         [\+\n]
digito      [0-9]
signo       (\-|\+)
suc         ({digito}+)
enter       ({signo}?{suc})
real1       ({enter}\.{digito}*)
real2       ({signo}?\.{suc})
descriptor  (\^{inicioDes}\:\{digito})
        int ent=0, real=0, ident=0, sumaent=0;
        int numero_descriptores=0;
        int numero_nucleotidos=0; /*número total de nucleotidos*/
        int nA=0, nC=0, nG=0, nT=0, nR=0; /*numero de nucleotidos*/
        int totalRestricciones = 0;  /*número total de enzimas de restricción encontradas*/
%%

       char cadena[100]; int i=0; char cnt[10]; 

{separador}{suc}                        {
                                            memcpy(&cnt, &yytext[1], strlen(&yytext[1]));
                                            printf("Secuencia número %s",cnt);
                                        }
{A}                                     {nA++;}
{G}                                     {nG++;}
{T}                                     {nT++;}
({G}{C}({A}|{T}|{G}|{C}){G}{C})*        {printf("#\tRestricción encontrada\n");
                                         totalRestricciones++;

                                         memcpy(&cadena, &yytext[0], strlen(&yytext[0]));
                                         printf("Enzima de restricción: %s", cadena); 
                                        }
{inicioDes}{car}({car}|{digito})*       {ident++; printf("Identificador secuencia %s\n",yytext);}
.|\                          {;}
%%
yywrap()
        {       printf("A: %d\n",nA);
                printf("C: %d\n",nC);
                printf("G: %d\n",nG);
                printf("T: %d\n",nT);
                int nNucleotidos=nA+nC+nG+nT;
                printf("Número total de nucleotidos: %d\n",nNucleotidos);

                printf("Num. ident %d",ident);
            return 1;
        }
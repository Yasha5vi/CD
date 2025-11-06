/*
Design a lex code to remove single line and multi line comments at run time
from in.c file and store the output in out.c file
*/

%{
    #include<stdio.h>
    #include<stdlib.h>
    int count = 0;
%}
%% 
"//".*          {count++;}
"/*"([^*]|\*+[^*/])*\*+"/"        {count++;}
.|\n                {fprintf(yyout,"%s",yytext);}
%%
int yywrap(){
    return 1;
}
int main(){
    FILE* f1 = fopen("in.c","r");
    FILE* f2 = fopen("out.c","w");
    if(!f1 || !f2){
        printf("Error opening file\n");
        return 0;
    }
    yyin = f1;
    yyout = f2;
    yylex();
    printf("Comments removed : %d\n",count);
    fclose(f1);
    fclose(f2);
    return 0;
}
%{
    #include<stdio.h>
    extern FILE* yyin,* yyout;    
%}

%%
[ \t\r\n]+    {fprintf(yyout," ");}
.           {fprintf(yyout,"%s",yytext);}
%%

int yywrap(){
    return 1;
}

int main(){
    FILE* f1 = fopen("in.txt","r");
    FILE* f2 = fopen("out.txt","w");
    if(!f1 || !f2){
        printf("Error opening file");
        return 0;
    }
    yyin = f1;
    yyout = f2;
    yylex();
    fclose(f1);
    fclose(f2);
    return 0;
}
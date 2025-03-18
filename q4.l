/*
    Design a lex code for tokenizing (identify and print 
    operators,separators,keywords,identifiers) in the given C-fragment
*/

%{
    #include<stdio.h>
    #include<string.h>    
    char opr[100] = "";
    char sep[100] = "";
    char key[100] = "";
    char ide[100] = "";
%}
%%
"if"|"else"|"for"|"return"|"while"|"int"|"float"    {strcat(key," ");strcat(key,yytext);}
"{"|"}"|"("|")"|","|";"                         {strcat(sep," ");strcat(sep,yytext);}
"+"|"++"|"-"|"--"|"*"|"/"|"<="                  {strcat(opr," ");strcat(opr,yytext);}
[a-zA-Z_]([a-zA-Z_0-9])*                        {strcat(ide," ");strcat(ide,yytext);}
%%
int yywrap(){
    return 1;
}

int main(){
    FILE* f1 = fopen("in.txt","r");
    FILE* f2 = fopen("out.txt","w");
    if(!f1 || !f2){
        printf("Error opening file\n");
        return 0;
    }
    yyin = f1;
    yylex();
    fprintf(f2,"Keyword: %s\n",key);
    fprintf(f2,"Separator: %s\n",sep);
    fprintf(f2,"Operator: %s\n",opr);
    fprintf(f2,"Identifier: %s\n",ide);
    return 0;
}
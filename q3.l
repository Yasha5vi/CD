/*
Design a LEX code to idenitfy and print intger and float value in given input pattern
*/

%{
    #include<stdio.h>    
%}

%%
[0-9]+\.[0-9]+      {printf("Float : %s",yytext);}
[0-9]+              {printf("Integer : %s",yytext);}
.*                  {printf("Invalid number");}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}
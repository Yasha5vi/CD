/*
Design a lex code to identify and print valid identifier of C/C++ in given input pattern
*/

%{
    #include<stdio.h>    
%}
%%
[A-Za-z_]([a-zA-Z0-9_])*    {printf("Valid identifier\n");}
.*                          {printf("Invalid Identifier\n");}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
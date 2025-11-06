%{
    #include<stdio.h>
    #include<stdlib.h>    
%}

%token NUMBER NL
%left '+''-'
%left '*''/'
%left '('')'

%%
stmt: E NL {printf("valid arithematic exp\n");}
E : E'+'E|E'-'E|E'*'E|E'/'E|'('E')'|NUMBER
%%

int yyerror(){
    printf("invalid\n");
    return 1;
}

int main(){
    yyparse();
    return 0;
}
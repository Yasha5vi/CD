%{
    #include<stdio.h>
    #include<stdlib.h>    
%}

%token A B NL

%%
stmt: S NL {printf("Valid string\n");}
S : A S B
|
;
%%

int yyerror(){
    printf("invalid");
    return 1;
}

int main(){
    yyparse();
    return 0;
}
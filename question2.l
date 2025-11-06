%{
    #include<stdio.h>   
%}

%%
[a-zA-Z_]([a-zA-Z_0-9])*          {printf("valid\n");}
.*              {printf("invalid\n");}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
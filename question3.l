%{
    #include<stdio.h>   
%}

%%
[0-9]+  {printf("Integer\n");}
[0-9]+\.[0-9]+  {printf("float\n");}
.*              {printf("invalid\n");}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
/*
Design a lex program to remove HTML tags
*/


%{
    #include<stdio.h>    
%}
%%
"<"[^<>]*">"    {   }
.               {printf("%s",yytext);}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}
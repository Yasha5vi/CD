/*
Write a lex program to print your name with input your name
*/

%{
    #include<stdio.h>    
%}
%%
"yashasvi"      {printf("%s\n",yytext);}
.               {}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}

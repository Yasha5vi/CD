/*
Write a lex program to check whether an email is 
valid or not
*/


%{
    #include<stdio.h>    
%}
%%
^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$     {printf("Valid");}
.*                                       {printf("Invalid");}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}
/*
Design a lex program to check for even a and even b of a dfa
*/

%{
    #include<stdio.h>    
%}
%%
^(aa|bb|(ab|ba)(aa|bb)*(ab|ba))*$   printf("Accepted\n");
.*                                  printf("Rejected\n");
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}


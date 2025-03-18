/*
Write a lex program to count alpha numeric 
*/
%{
    #include<stdio.h>
    int a = 0, n = 0;
%}

%%
[a-zA-Z]   {a++;}
[0-9]      {n++;}
.           {}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("Alphabet count : %d\n",a);
    printf("Numbers count : %d\n",n);
    return 0;
}
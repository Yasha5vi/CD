%{
    #include<stdio.h>    
%}

%s A B C DEAD

%%
<INITIAL>[0-9]+ {BEGIN(A);}
<INITIAL>[0-9]+\.+[0-9]+ {BEGIN(B);}
<INITIAL>[a-zA-Z_][a-zA_Z_0-9]* {BEGIN(C);}
<INITIAL>[^\n] {BEGIN(DEAD);}
<INITIAL>\n {BEGIN(INITIAL);printf("invalid\n");}

<A>[^\n] {BEGIN(DEAD);}
<A>\n {BEGIN(INITIAL);printf("integer\n");}

<B>[^\n] {BEGIN(DEAD);}
<B>\n {BEGIN(INITIAL);printf("float\n");}

<C>[^\n] {BEGIN(DEAD);}
<C>\n {BEGIN(INITIAL);printf("identifier\n");}

<DEAD>[^\n] {BEGIN(DEAD);}
<DEAD>\n {BEGIN(INITIAL);printf("Invalid\n");}
%%

int yywrap(){
    return 1;
}

int main(){
    printf("Enter your string\n");
    yylex();
    return 1;
}
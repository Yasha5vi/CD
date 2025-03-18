/*
Write a lex program to omit alternate characters
*/

%{
    #include<stdio.h>
    #include<string.h>
    int count = 0; 
    char res[100];   
%}
%%
.   {
    if(count%2 == 0){
        strcat(res,yytext);
    }
    count++;
}

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("New string : %s",res);
    return 0;
}
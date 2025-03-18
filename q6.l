/*
Design a lex code to replace white spaces of in.txt file by 
a single blank character into out.txt file
*/

%{
    #include<stdio.h>
    #include<string.h>
    char res[100] = "";   
%}
%%
[ \t\n]+        {strcat(res," ");}  
.              {strcat(res,yytext);}       
%%
int yywrap(){
    return 1;
}

int main(){
    FILE* f1 = fopen("in.txt","r");
    FILE* f2 = fopen("out.txt","w");
    if(!f1 || !f2){
        printf("Error opening file\n");
        return 0;
    }
    yyin = f1;
    yylex();
    fprintf(f2,"%s",res);
    return 0;
}
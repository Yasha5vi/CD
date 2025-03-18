/*
Design a lex code to print the number of total characters, words,whitespaces, in in.txt file
*/

%{
    #include<stdio.h>
    int words = 0,chars = 0,spaces = 0;    
%}
%%
[ \t\n]                         {spaces++;}
[a-zA-Z0-9]+    {
    words++;
    for(int i=0;i<yyleng;i++){
        if(yytext[i]<'0' || yytext[i]>'9'){
            chars++;
        }
    }
}
.                               {chars++;}
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
    fprintf(f2,"Total characters : %d\n",chars);
    fprintf(f2,"Total Spaces : %d\n",spaces);
    fprintf(f2,"Total words : %d\n",words);
}
%{
    #include<stdio.h>
    extern FILE* yyin,* yyout;  
    int words = 0,space = 0,chars = 0;  
%}

%%
[ \t\n]+    {space++;}
[a-zA-Z0-9]+    {
    words++;
    for(int i=0;i<yyleng;i++){
        if(yytext[i] < '0' || yytext[i] > '9'){
            chars++;
        }
    }
}
.           {chars++;}
%%

int yywrap(){
    return 1;
}

int main(){
    FILE* f1 = fopen("in.txt","r");
    FILE* f2 = fopen("out.txt","w");
    if(!f1 || !f2){
        printf("Error opening file");
        return 0;
    }
    yyin = f1;
    yyout = f2;
    yylex();
    printf("spaces : %d\nwords : %d\nchars : %d",space,words,chars);
    fclose(f1);
    fclose(f2);
    return 0;
}
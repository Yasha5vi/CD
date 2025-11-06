%{
    #include<stdio.h>  
    int nl=0,tab = 0,chars = 0;
    extern FILE *yyin;
%}

%%
\n      {nl++;}
[\t]    {tab++;}
.       {chars++;}
%%

int yywrap(){
    return 1;
}

int main(){
    FILE* f1 = fopen("in.txt","r");
    if(!f1){
        printf("Error opening file");
        return 0;
    }
    yyin = f1;
    yylex();
    printf("new line : %d\n tabs : %d\n chars : %d\n",nl,tab,chars);
    return 0;
}
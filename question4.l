%{
    #include<stdio.h>
    extern FILE* yyin,* yyout;    
    char opr[100]="",sep[100]="",key[100]="",iden[100]="";
%}

%%
"if"|"while"|"for"|"else"|"return"|"int"|"float"    {strcat(key," ");strcat(key,yytext);}
"("|")"|"{"|"}"|";"|","                             {strcat(sep," ");strcat(sep,yytext);}
"+"|"-"|"*"|"/"|"++"|"--"                           {strcat(opr," ");strcat(opr,yytext);}
[a-zA-Z_]([a-zA-Z0-9_])*                            {strcat(iden," ");strcat(iden,yytext);}
.                                                   {}
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
    fprintf(yyout,"%s\n",key);
    fprintf(yyout,"%s\n",opr);
    fprintf(yyout,"%s\n",sep);
    fprintf(yyout,"%s\n",iden);
    fclose(f1);
    fclose(f2);
    return 0;
}
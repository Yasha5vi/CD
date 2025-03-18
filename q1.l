/*
lex code to count the number of lines spaces tab meta characters and rest of characters
*/

%{
    #include<stdio.h>
    int n=0,s=0,t=0,c=0;
%}
%%
[\n]    {n++;}
[ ]     {s++;}
[\t]    {t++;}
.       {c++;}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("Newlines : %d\n",n);
    printf("Spaces : %d\n",s);
    printf("Tabs : %d\n",t);
    printf("Characters : %d\n",c);
    return 0;
}
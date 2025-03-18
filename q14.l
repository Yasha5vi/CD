/*
Design a lex program to check for valid date
*/

%{
    #include<stdio.h>
    #include<stdlib.h>
    int d,m,y;
    int check(char*);
%}
%%
[0-9][0-9]-[0|1][0-9]-[0-9][0-9][0-9][0-9]  {check(yytext);}
.*                                          {printf("Invalid\n");}
%%
int check(char* res){
    sscanf(res,"%2d-%2d-%4d",&d,&m,&y);
    int valid = 1;
    int maxDay;
    if(m<1 || m>12){
        valid = 0;
    }else{
        switch(m){
            case 2:
                if((y%4 == 0 && y%100 != 0)||(y%400 == 0)){
                    maxDay = 29;
                }else{
                    maxDay = 28;
                }
                break;
            case 4:case 6:case 9:case 11:
                maxDay = 30;
                break;
            default:
                maxDay = 31;
                break;
        }
        if(d<1 || d>maxDay){
            valid = 0;
        }
    }
    if(valid) printf("Valid\n");
    else printf("Invalid\n");
}
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}
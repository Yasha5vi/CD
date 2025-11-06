%{
    #include<stdio.h>    
%}

%s S0 S1 S2 S3 INV 

%%
<INITIAL>a {BEGIN(S1);}
<INITIAL>b {BEGIN(S2);}
<INITIAL>[^ab\n] {BEGIN(INV);}
<INITIAL>\n {BEGIN(INITIAL);printf("NOT ACCEPTED\n");}

<S0>a {BEGIN(S1);}
<S0>b {BEGIN(S2);}
<S0>[^ab\n] {BEGIN(INV);}
<S0>\n {BEGIN(INITIAL);printf("ACCEPTED\n");}

<S1>a {BEGIN(S0);}
<S1>b {BEGIN(S3);}
<S1>[^ab\n] {BEGIN(INV);}
<S1>\n {BEGIN(INITIAL);printf("not accepted\n");}

<S2>a {BEGIN(S3);}
<S2>b {BEGIN(S0);}
<S2>[^ab\n] {BEGIN(INV);}
<S2>\n {BEGIN(INITIAL);printf("not accepted\n");}

<S3>a {BEGIN(S2);}
<S3>b {BEGIN(S1);}
<S3>[^ab\n] {BEGIN(INV);}
<S3>\n {BEGIN(INITIAL);printf("not accepted\n");}

<INV>[^\n] {BEGIN(INV);}
<INV>\n {BEGIN(INITIAL);printf("not accepted\n");}

%%

int yywrap(){
    return 1;
}

int main(){
    printf("Enter your string \n");
    yylex();
    return 0;
}


%{
    #include<stdio.h>    
%}

%s A B C D E F G H DEAD

%%
<INITIAL>a {BEGIN(B);}
<INITIAL>b {BEGIN(A);}
<INITIAL>[^ab\n] {BEGIN(DEAD);}
<INITIAL>\n {BEGIN(INITIAL);printf("not accepted\n");}

<A>a {BEGIN(B);}
<A>b {BEGIN(A);}
<A>[^ab\n] {BEGIN(DEAD);}
<A>\n {BEGIN(INITIAL);printf("not accepted\n");}

<B>a {BEGIN(C);}
<B>b {BEGIN(D);}
<B>[^ab\n] {BEGIN(DEAD);}
<B>\n {BEGIN(INITIAL);printf("not accepted\n");}

<C>a {BEGIN(E);}
<C>b {BEGIN(F);}
<C>[^ab\n] {BEGIN(DEAD);}
<C>\n {BEGIN(INITIAL);printf("not accepted\n");}

<D>a {BEGIN(G);}
<D>b {BEGIN(H);}
<D>[^ab\n] {BEGIN(DEAD);}
<D>\n {BEGIN(INITIAL);printf("not accepted\n");}

<E>a {BEGIN(E);}
<E>b {BEGIN(F);}
<E>[^ab\n] {BEGIN(DEAD);}
<E>\n {BEGIN(INITIAL);printf("accepted\n");}

<F>a {BEGIN(G);}
<F>b {BEGIN(H);}
<F>[^ab\n] {BEGIN(DEAD);}
<F>\n {BEGIN(INITIAL);printf("accepted\n");}

<G>a {BEGIN(C);}
<G>b {BEGIN(D);}
<G>[^ab\n] {BEGIN(DEAD);}
<G>\n {BEGIN(INITIAL);printf("accepted\n");}

<H>a {BEGIN(B);}
<H>b {BEGIN(A);}
<H>[^ab\n] {BEGIN(DEAD);}
<H>\n {BEGIN(INITIAL);printf("accepted\n");}

<DEAD>[^\n] {BEGIN(DEAD);}
<DEAD>\n {BEGIN(INITIAL);printf("not accepted\n");}
%%

int yywrap(){
    return 1;
}

int main(){
    printf("Enter your string");
    yylex();

    return 0;
}


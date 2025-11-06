%{
    #include<stdio.h>
    #include<stdlib.h> 
    void yyerror(char* s);  
%}

%token NUMBER NL
%left '+''-'
%left '*''/'
%left '('')'

%%
stmt: E NL {printf("Result : %d",$$); return 0;}
E : E'+'E {$$ = $1+$3;}
E : E'-'E {$$ = $1-$3;}
E : E'*'E {$$ = $1*$3;}
E : E'/'E {if($3==0){
                yyerror("division by 0");
                YYABORT;
            }
            $$ = $1/$3;}
E : '('E')' {$$ = $2;}
E : NUMBER {$$ = $1;}

%%

void yyerror(char* s){
    printf("invalid: %s",s);
}

int main(){
    yyparse();
    return 0;
}
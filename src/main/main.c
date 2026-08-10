#include <stdio.h>
#include "../parser/semantic.h"

int yyparse(void);

int yyparse(void);

int main(void)
{
    printf("BongoScript Compiler\n");
    printf("--------------------\n");

    semantic_init();
    yyparse();

    return 0;
}
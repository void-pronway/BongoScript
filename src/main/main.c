#include <stdio.h>
#include "../parser/semantic.h"

int yyparse(void);

int main(void)
{
    int parse_result;

    printf("BongoScript Compiler\n");
    printf("--------------------\n");

    semantic_init();

    parse_result = yyparse();

    if (parse_result != 0) {
        return 1;
    }

    return 0;
}
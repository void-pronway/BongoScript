%option noyywrap
%option yylineno

%{
#include <stdio.h>
#include "parser.tab.h"
%}

/* ASCII integer */
NUMBER_ASCII    [0-9]+

/* Bengali integer */
NUMBER_BANGLA   ("০"|"১"|"২"|"৩"|"৪"|"৫"|"৬"|"৭"|"৮"|"৯")+

%%

"শুরু"          { return START; }
"শেষ"           { return END; }

"লাইট"          { return LIGHT; }
"ফ্যান"          { return FAN; }
"এসি"            { return AC; }

"চালু"          { return ON; }
"বন্ধ"           { return OFF; }

"তাপমাত্রা"      { return TEMPERATURE; }
"হলে"            { return IF; }

";"              { return SEMICOLON; }

{NUMBER_ASCII}   { return NUMBER; }
{NUMBER_BANGLA}  { return NUMBER; }

"//"[^\n]*       ;

[ \t\r\n]+       ;

. {
    fprintf(
        stderr,
        "Lexical Error at line %d: unexpected input '%s'\n",
        yylineno,
        yytext
    );

    return (unsigned char)yytext[0];
}

%%
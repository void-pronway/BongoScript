%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token START END
%token LIGHT FAN AC
%token ON OFF
%token TEMPERATURE IF
%token NUMBER
%token SEMICOLON

%start program

%%

command_list:
    command
  | command_list command
;

program:
    START command_list END
    {
        printf("Compilation Successful\n");
    }
;

command:
    LIGHT ON SEMICOLON
    {
        printf("LIGHT -> ON\n");
    }
  | LIGHT OFF SEMICOLON
    {
        printf("LIGHT -> OFF\n");
    }
  | FAN ON SEMICOLON
    {
        printf("FAN -> ON\n");
    }
  | FAN OFF SEMICOLON
    {
        printf("FAN -> OFF\n");
    }
  | AC ON SEMICOLON
    {
        printf("AC -> ON\n");
    }
  | AC OFF SEMICOLON
    {
        printf("AC -> OFF\n");
    }
  | TEMPERATURE NUMBER IF command
    {
        printf("Temperature condition detected\n");
    }
;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Syntax Error: %s\n", s);
}



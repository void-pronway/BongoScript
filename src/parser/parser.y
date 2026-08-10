%{
#include <stdio.h>
#include "semantic.h"

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
        process_device_command(DEVICE_LIGHT, ACTION_ON);
    }
  | LIGHT OFF SEMICOLON
    {
        process_device_command(DEVICE_LIGHT, ACTION_OFF);
    }
  | FAN ON SEMICOLON
    {
        process_device_command(DEVICE_FAN, ACTION_ON);
    }
  | FAN OFF SEMICOLON
    {
        process_device_command(DEVICE_FAN, ACTION_OFF);
    }
  | AC ON SEMICOLON
    {
        process_device_command(DEVICE_AC, ACTION_ON);
    }   
  | AC OFF SEMICOLON
    {
        process_device_command(DEVICE_AC, ACTION_OFF);
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



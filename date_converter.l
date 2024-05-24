%{
#include "date_converter.tab.h"
%}

%%

[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}:.*\n   { 
    yylval.string = strdup(yytext); 
    return LINE; 
}

%%

int yywrap() {
    return 1;
}

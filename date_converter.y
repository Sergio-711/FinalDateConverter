%{
#include <stdio.h>
#include <string.h>
int yylex(void);
void yyerror(const char *s);
void process_line(char* line); 
%}

%union {
    char* string;
}

%token <string> LINE

%%

log: 
    log LINE { process_line($2); free($2); }
   | /* empty */
   ;

%%

void process_line(char* line) {
    char new_date[20];
    int i, j = 0;

    for (i = 0; i < 20; i++) {
        if (line[i] != '-' && line[i] != ':') {
            new_date[j++] = line[i];
        }
    }
    new_date[j] = 'Z';

    printf("%s: %s\n", new_date, line + 20);
}

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

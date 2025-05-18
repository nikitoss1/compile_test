%{
#include "y.tab.h"
#include <iostream>
#include <string>
%}


%%

"+"     { return  PLUS; }

[0-9]+ {
    yylval.number = std::atoi(yytext);
    return NUMBER;
}

.|\n    {}

%%
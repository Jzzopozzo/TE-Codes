/*
TITLE: Assignment to implement a parser that accepts all strings that begin with "10".
*/
%{
	#include "y.tab.h"
%}

exp "10".*

%%
{exp} {return (START);}
. {return (OTHER);}
%%

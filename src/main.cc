#include <bits/stdc++.h>
// #include "tree.hpp"
using namespace std;
extern int yydebug;
extern int yyparse();
extern int yylex();
extern void yyset_in(FILE *input);
extern int yylineno;
extern FILE *yyin;
extern int line_error;
// extern Node* Root;

FILE *input;
int main(int argc, char **argv)
{
    yylineno = 1;
    if (argc < 2)
    {
		std::cerr << "Usage: " << argv[0] << "<input file> [output file]" << std::endl;
        return 1;
    }
	if(!(yyin = fopen(argv[1], "r")))
	{
		std::cerr << "Open file error : " << argv[1] << std::endl;
		return 1;
	}
	if(yyparse())
	{
		std::cerr << "Failed to parse the file : " << argv[1] << std::endl;
		return 1; 
	}
	// if(!line_error)
	// 	Print_Tree(Root, 0);
	std::cerr << "\nParse success !" << std::endl;
    fclose(yyin);
    return 0;
}

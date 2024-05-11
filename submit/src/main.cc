#include <bits/stdc++.h>
#include "tree.hpp"
#include "semantic.hpp"
#include "ir.hpp"
using namespace std;
extern int yydebug;
extern int yyparse();
extern int yylex();
extern int yylineno;
extern FILE *yyin;
extern int line_error;
extern Node* Root;
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

	// Root->print(0);
	Checker checker;
	if(!checker.check(Root))
	{
		std::cerr << "Failed in semantic analysis : " << argv[1] << std::endl;
		return 1;
	}

	// Root->print(0);
	string IR_OUT = "ir.out";
	if(argc >= 3) IR_OUT = string(argv[2]);
	IR ir(&checker, Root);
	ofstream ir_out(IR_OUT);
	ir.print(ir_out);
	// ir.print(cerr);


	std::cerr << "\nParse success !" << std::endl;
    fclose(yyin);
    return 0;
}

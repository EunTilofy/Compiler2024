%option noinput
%option nounput
%option noyywrap
%option yylineno

%{
// #include "tree.hpp"
#include "sysy.tab.hh"
#include <bits/stdc++.h>
using namespace std;
extern FILE *input;

int line_error;

// #define YY_USER_ACTION \
//    yylloc.first_line = yylloc.last_line = yylineno;


void error_print(int line, std::string text, std::string msg)
{
    if (line_error == line) return;
    line_error = line;
    std::cout << "Error at Line " << line << " " << msg << "\"" << text << "\".\n";
}
%}

digit [0-9]
blank [ \t\r\n]
letter [a-zA-Z]
alpha _|{letter}
Comment1 "/*"[^*]*"*"+([^*/][^*]*"*"+)*"/"
Comment2 "//"[^\r\n]* 
ident {alpha}({alpha}|{digit})*
oct 0[0-7]+
hex 0[Xx][0-9a-fA-F]+
zero 0
n_zero [1-9]+{digit}*
integer {zero}|{n_zero}
newline "\n"
ws [ \r\t\n]+

%%
{Comment1}		{                                                                           /*std::cerr << yytext;*/                    /* nothing to do */ }
{Comment2}      {                                                                           /*std::cerr << yytext;*/                    /* nothing to do */ }
"int"           {   /* yylval.NODE = New_word("TYPE", yytext, INT_TYPE, yylineno);     */   /*std::cerr << yytext;*/                    return INT; }
"void"          {   /* yylval.NODE = New_word("VOID", yytext, TERMINAL, yylineno);     */   /*std::cerr << yytext;*/                    return VOID; }
"if"            {   /* yylval.NODE = New_word("IF", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return IF; }
"else"          {   /* yylval.NODE = New_word("ELSE", yytext, TERMINAL, yylineno);     */   /*std::cerr << yytext;*/                    return ELSE; }
"while"         {   /* yylval.NODE = New_word("WHILE", yytext, TERMINAL, yylineno);    */   /*std::cerr << yytext;*/                    return WHILE; }
"return"        {   /* yylval.NODE = New_word("RETURN", yytext, TERMINAL, yylineno);   */   /*std::cerr << yytext;*/                    return RETURN; }
"break"         {   /* yylval.NODE = New_word("BREAK", yytext, TERMINAL, yylineno);    */   /*std::cerr << yytext;*/                    return BREAK; }
"continue"      {   /* yylval.NODE = New_word("CONTINUE", yytext, TERMINAL, yylineno); */   /*std::cerr << yytext;*/                    return CONTINUE; }
"+"             {   /* yylval.NODE = New_word("ADD", yytext, TERMINAL, yylineno);      */   /*std::cerr << yytext;*/                    return ADD; }
"-"             {   /* yylval.NODE = New_word("SUB", yytext, TERMINAL, yylineno);      */   /*std::cerr << yytext;*/                    return SUB; }
"*"             {   /* yylval.NODE = New_word("MUL", yytext, TERMINAL, yylineno);      */   /*std::cerr << yytext;*/                    return MUL; }
"/"             {   /* yylval.NODE = New_word("DIV", yytext, TERMINAL, yylineno);      */   /*std::cerr << yytext;*/                    return DIV; }
"%"             {   /* yylval.NODE = New_word("MOD", yytext, TERMINAL, yylineno);      */   /*std::cerr << yytext;*/                    return MOD; }
"="             {   /* yylval.NODE = New_word("ASSIGN", yytext, TERMINAL, yylineno);   */   /*std::cerr << yytext;*/                    return ASSIGN; }
"=="            {   /* yylval.NODE = New_word("EQ", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return EQ; }
"!="            {   /* yylval.NODE = New_word("NEQ", yytext, TERMINAL, yylineno);      */   /*std::cerr << yytext;*/                    return NEQ; }
"<"             {   /* yylval.NODE = New_word("LT", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return LT; }
"<="            {   /* yylval.NODE = New_word("LE", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return LE; }
">"             {   /* yylval.NODE = New_word("GT", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return GT; }
">="            {   /* yylval.NODE = New_word("GE", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return GE; }
"&&"            {   /* yylval.NODE = New_word("AND", yytext, TERMINAL, yylineno);      */   /*std::cerr << yytext;*/                    return AND; }
"||"            {   /* yylval.NODE = New_word("OR", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return OR; }
"!"             {   /* yylval.NODE = New_word("NOT", yytext, TERMINAL, yylineno);      */   /*std::cerr << yytext;*/                    return NOT; }
";"             {   /* yylval.NODE = New_word("SEMI", yytext, TERMINAL, yylineno);     */   /*std::cerr << yytext;*/                    return SEMI; }
","             {   /* yylval.NODE = New_word("COMMA", yytext, TERMINAL, yylineno);    */   /*std::cerr << yytext;*/                    return COMMA; }
"("             {   /* yylval.NODE = New_word("LP", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return LPAREN; }
")"             {   /* yylval.NODE = New_word("RP", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return RPAREN; }
"["             {   /* yylval.NODE = New_word("LB", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return LBRACKET; }
"]"             {   /* yylval.NODE = New_word("RB", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return RBRACKET; }
"{"             {   /* yylval.NODE = New_word("LC", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return LBRACE; }
"}"             {   /* yylval.NODE = New_word("RC", yytext, TERMINAL, yylineno);       */   /*std::cerr << yytext;*/                    return RBRACE; }
{ident}         {   /* yylval.NODE = New_word("IDENT", yytext, ID_TML, yylineno);      */   /*std::cerr << yytext;*/                    return IDENT; }
{hex}           {   /* yylval.NODE = New_word("INTCONST", yytext, INT_TML, yylineno);  */   /*std::cerr << yytext;*/                    return INTCONST; }
{oct}           {   /* yylval.NODE = New_word("INTCONST", yytext, INT_TML, yylineno);  */   /*std::cerr << yytext;*/                    return INTCONST; }
{integer}       {   /* yylval.NODE = New_word("INTCONST", yytext, INT_TML, yylineno);  */   /*std::cerr << yytext;*/                    return INTCONST; }
{ws}            {   /* nothing to do */}
.               {   
                    error_print(yylineno, std::string(yytext), "Mysterious character");
                    return 0; 
                }

%%


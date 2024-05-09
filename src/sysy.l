%option noyywrap
%option yylineno
%option noinput
%option nounput

%{
#include "tree.hpp"
#include "sysy.tab.hh"
#include <bits/stdc++.h>
using namespace std;
extern FILE *input;

int line_error;

void error_print(int line, std::string text, std::string msg)
{
    if (line_error == line) return;
    line_error = line;
    std::cout << "Error at Line " << line << " " << msg << "\"" << text << "\".\n";
}
%}

digit [0-9]
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
newline \n
ws [ \r\t\n]+

%%
{Comment1}		{                                           /*std::cerr << yytext;*/                    /* nothing to do */ }
{Comment2}      {                                           /*std::cerr << yytext;*/                    /* nothing to do */ }
"int"           {    yylval.NODE = New_word("INT", yytext);         /*std::cerr << yytext;*/                    return INT; }
"void"          {    yylval.NODE = New_word("VOID", yytext);        /*std::cerr << yytext;*/                    return VOID; }
"if"            {    yylval.NODE = New_word("IF", yytext);          /*std::cerr << yytext;*/                    return IF; }
"else"          {    yylval.NODE = New_word("ELSE", yytext);        /*std::cerr << yytext;*/                    return ELSE; }
"while"         {    yylval.NODE = New_word("WHILE", yytext);       /*std::cerr << yytext;*/                    return WHILE; }
"return"        {    yylval.NODE = New_word("RETURN", yytext);      /*std::cerr << yytext;*/                    return RETURN; }
"break"         {    yylval.NODE = New_word("BREAK", yytext);       /*std::cerr << yytext;*/                    return BREAK; }
"continue"      {    yylval.NODE = New_word("CONTINUE", yytext);    /*std::cerr << yytext;*/                    return CONTINUE; }
"+"             {    yylval.NODE = New_word("ADD", yytext);         /*std::cerr << yytext;*/                    return ADD; }
"-"             {    yylval.NODE = New_word("SUB", yytext);         /*std::cerr << yytext;*/                    return SUB; }
"*"             {    yylval.NODE = New_word("MUL", yytext);         /*std::cerr << yytext;*/                    return MUL; }
"/"             {    yylval.NODE = New_word("DIV", yytext);         /*std::cerr << yytext;*/                    return DIV; }
"%"             {    yylval.NODE = New_word("MOD", yytext);         /*std::cerr << yytext;*/                    return MOD; }
"="             {    yylval.NODE = New_word("ASSIGN", yytext);      /*std::cerr << yytext;*/                    return ASSIGN; }
"=="            {    yylval.NODE = New_word("EQ", yytext);          /*std::cerr << yytext;*/                    return EQ; }
"!="            {    yylval.NODE = New_word("NEQ", yytext);         /*std::cerr << yytext;*/                    return NEQ; }
"<"             {    yylval.NODE = New_word("LT", yytext);          /*std::cerr << yytext;*/                    return LT; }
"<="            {    yylval.NODE = New_word("LE", yytext);          /*std::cerr << yytext;*/                    return LE; }
">"             {    yylval.NODE = New_word("GT", yytext);          /*std::cerr << yytext;*/                    return GT; }
">="            {    yylval.NODE = New_word("GE", yytext);          /*std::cerr << yytext;*/                    return GE; }
"&&"            {    yylval.NODE = New_word("AND", yytext);         /*std::cerr << yytext;*/                    return AND; }
"||"            {    yylval.NODE = New_word("OR", yytext);          /*std::cerr << yytext;*/                    return OR; }
"!"             {    yylval.NODE = New_word("NOT", yytext);         /*std::cerr << yytext;*/                    return NOT; }
";"             {    yylval.NODE = New_word("SEMI", yytext);        /*std::cerr << yytext;*/                    return SEMI; }
","             {    yylval.NODE = New_word("COMMA", yytext);       /*std::cerr << yytext;*/                    return COMMA; }
"("             {    yylval.NODE = New_word("LP", yytext);          /*std::cerr << yytext;*/                    return LPAREN; }
")"             {    yylval.NODE = New_word("RP", yytext);          /*std::cerr << yytext;*/                    return RPAREN; }
"["             {    yylval.NODE = New_word("LB", yytext);          /*std::cerr << yytext;*/                    return LBRACKET; }
"]"             {    yylval.NODE = New_word("RB", yytext);          /*std::cerr << yytext;*/                    return RBRACKET; }
"{"             {    yylval.NODE = New_word("LC", yytext);          /*std::cerr << yytext;*/                    return LBRACE; }
"}"             {    yylval.NODE = New_word("RC", yytext);          /*std::cerr << yytext;*/                    return RBRACE; }
{ident}         {    yylval.NODE = New_word("IDENT", yytext);       /*std::cerr << yytext;*/                    return IDENT; }
{hex}           {    yylval.NODE = New_word("INTCONST", yytext);    /*std::cerr << yytext;*/                    return INTCONST; }
{oct}           {    yylval.NODE = New_word("INTCONST", yytext);    /*std::cerr << yytext;*/                    return INTCONST; }
{integer}       {    yylval.NODE = New_word("INTCONST", yytext);    /*std::cerr << yytext;*/                    return INTCONST; }
{ws}            {    /* nothing to do */ }
.               {   
                    cout << yytext << "\n";
                    error_print(yylineno, std::string(yytext), "Mysterious character");
                    return 0; 
                }

%%


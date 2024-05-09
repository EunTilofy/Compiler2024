%{
#include <bits/stdc++.h>
#include "tree.hpp"
using namespace std;
#define YYDEBUG 1
void yyerror(const char *s);
extern int yylex(void);
extern Node* Root;
%}

%union {
   Node *NODE;
}

%start ROOT
%token <NODE> ADD SUB MUL DIV MOD ASSIGN EQ NEQ
%token <NODE> LT LE GT GE AND OR NOT
%token <NODE> SEMI COMMA
%token <NODE> LPAREN "("
%token <NODE> RPAREN ")"
%token <NODE> LBRACKET "["
%token <NODE> RBRACKET "]"
%token <NODE> LBRACE "{"
%token <NODE> RBRACE "}"
%token <NODE> INT VOID IF ELSE WHILE RETURN BREAK CONTINUE
%token <NODE> IDENT INTCONST

// non-terminal
%type <NODE> ROOT CompUnit Decl BType VarDef VarDecl VarDefs TypeHead
%type <NODE> Widths InitVal InitVals FuncHead FuncDef FuncParams FuncParam
%type <NODE> Block BlockItem BlockItems Stmt Exp Cond LVal LvalWidths UnaryExp
%type <NODE> PrimaryExp Number UnaryOp FuncRParams MulExp AddExp RelExp EqExp LAndExp LOrExp
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%

ROOT        : CompUnit                                                  { Root = $1; }
            ;

CompUnit    : Decl                                                      { $$ = New_node("CompUnit", 1, $1); }
            | FuncDef                                                   { $$ = New_node("CompUnit", 1, $1); }
            | CompUnit Decl                                             { $$ = $$->add_child($2); }
            | CompUnit FuncDef                                          { $$ = $$->add_child($2); }
            ;

Decl        : VarDecl                                                   { $$ = New_node("Decl", 1, $1); }
            ;

BType       : INT                                                               
            ;

TypeHead    : BType IDENT                                               { $$ = New_node("TypeHead", 2, $1, $2); }
            ;

VarDef      : IDENT                                                     { $$ = New_node("VarDef", 1, $1); }
            | IDENT Widths                                              { $$ = New_node("ArrayDef", 2, $1, $2); }
            | IDENT ASSIGN InitVal                                      { $$ = New_node("VarDef", 2, $1, $3);}
            | IDENT Widths ASSIGN InitVal                               { $$ = New_node("ArrayDef", 3, $1, $2, $4); }
            ;

VarDecl     : TypeHead VarDefs SEMI                                     { $$ = New_node("VarDecl", 1, $1->child[0]); $$->add_child(New_node("VarDef", 1, $1->child[1])); $$->get_value($2); }
            | TypeHead Widths VarDefs SEMI                              { $$ = New_node("VarDecl", 1, $1->child[0]); $$->add_child(New_node("ArrayDef", 2, $1->child[1], $2)); $$->get_value($3); }
            | TypeHead ASSIGN InitVal VarDefs SEMI                      { $$ = New_node("VarDecl", 1, $1->child[0]); $$->add_child(New_node("VarDef", 2, $1->child[1], $3)); $$->get_value($4); }
            | TypeHead Widths ASSIGN InitVal VarDefs SEMI               { $$ = New_node("VarDecl", 1, $1->child[0]); $$->add_child(New_node("ArrayDef", 3, $1->child[1], $2, $4)); $$->get_value($5); }    
            ;

VarDefs     : VarDefs COMMA VarDef                                      { $$ = $$->add_child($3); }
            |                                                           { $$ = New_node("VarDefs", 0); }
            ;

Widths      : "[" INTCONST "]"                                          { $$ = New_node("Widths", 1, $2); }
            | Widths "[" INTCONST "]"                                   { $$ = $$->add_child($3); }
            ;

InitVal     : Exp                                                       { $$ = New_node("InitVal", 1, $1); }
            | "{"  "}"                                                  { $$ = New_node("InitVal", 0); }
            | "{" InitVals "}"                                          { $$ = New_node("InitVal", 1, $2); }
            ;

InitVals    : InitVal                                                   { $$ = New_node("InitVals", 1, $1); }
            | InitVals COMMA InitVal                                    { $$ = $$->add_child($3); }
            ;

FuncHead    : BType IDENT                                               { $$ = New_node("FuncHead", 2, $1, $2); }
            | VOID IDENT                                                { $$ = New_node("FuncHead", 2, $1, $2); }
            ;   

FuncDef     : FuncHead "(" FuncParams ")" Block                         { $$ = New_node("FuncDef", 0); $$->get_value($1); $$->add_child($3, $5); }
            | FuncHead "(" ")" Block                                    { $$ = New_node("FuncDef", 0); $$->get_value($1); $$->add_child(New_node("FuncParams", 0), $4); }
            ;

FuncParams  : FuncParam                                                 { $$ = New_node("FuncParams", 1, $1); }
            | FuncParams COMMA FuncParam                                { $$ = $$->add_child($3); }
            ;

FuncParam   : BType IDENT                                               { $$ = New_node("FuncParam", 2, $1, $2); }  
            | BType IDENT "[" "]"                                       { $$ = New_node("FuncParam", 2, $1, $2); $$->add_child(New_node("INTCONST", 0));}
            | BType IDENT "[" "]" Widths                                { $$ = New_node("FuncParam", 2, $1, $2); $$->add_child(New_node("INTCONST", 0)); $$->get_value($4); }

Block       : "{" "}"                                                   { $$ = New_node("Block", 0); }
            | "{" BlockItems "}"                                        { $$ = New_node("Block", 0); $$->get_value($2); }
            ;

BlockItems  : BlockItem                                                 { $$ = New_node("BlockItems", 1, $1); }       
            | BlockItems BlockItem                                      { $$ = $$->add_child($2); }
            ;

BlockItem   : Stmt                                                                   
            | Decl                                                                          
            ;

Stmt        : LVal ASSIGN Exp SEMI                                      { $$ = New_node("Assign", 2, $1, $3); }
            | Exp SEMI                                                  { $$ = New_node("Exp", 1, $1); }
            | SEMI                                                      { $$ = New_node("Exp", 0); }                 
            | Block                                                     { $$ = $1; }
            | IF "(" Cond ")" Stmt %prec LOWER_THAN_ELSE                { $$ = New_node("If", 2, $3, $5); }
            | IF "(" Cond ")" Stmt ELSE Stmt                            { $$ = New_node("IfElse", 3, $3, $5, $7); }
            | WHILE "(" Cond ")" Stmt                                   { $$ = New_node("While", 2, $3, $5); }
            | RETURN SEMI                                               { $$ = New_node("Return", 0); }
            | RETURN Exp SEMI                                           { $$ = New_node("Return", 1, $2); }
            ;

Exp         : AddExp                                                                      
            ;

Cond        : LOrExp                                                                     
            ;

LVal        : IDENT                                                     { $$ = New_node("LVal", 1, $1); }   
            | IDENT LvalWidths                                          { $$ = New_node("LVal", 2, $1, $2); }
            ;

LvalWidths  : "[" Exp "]"                                               { $$ = New_node("LvalWidths", 1, $2); }
            | LvalWidths "[" Exp "]"                                    { $$ = $$->add_child($3); }

PrimaryExp  : "(" Exp ")"                                               { $$ = New_node("PrimaryExp", 1, $2); }
            | LVal                                                      { $$ = New_node("PrimaryExp", 1, $1); }          
            | Number                                                    { $$ = New_node("PrimaryExp", 1, $1); }         
            ;

Number      : INTCONST                                                    
            ;

UnaryExp    : PrimaryExp                                                { $$ = New_node("UnaryExp", 1, $1); }      
            | IDENT "(" ")"                                             { $$ = New_node("FuncCall", 2, $1, New_node("FuncRParams", 0)); }   
            | IDENT "(" FuncRParams ")"                                 { $$ = New_node("FuncCall", 2, $1, $3); }   
            | UnaryOp UnaryExp                                          { $$ = New_node("UnaryExp", 2, $1, $2); } 
            ;

UnaryOp     : ADD                                                        
            | SUB                                                              
            | NOT                                                       
            ;

FuncRParams : Exp                                                       { $$ = New_node("FuncRParams", 1, $1); }  
            | FuncRParams COMMA Exp                                     { $$ = $$->add_child($3); }
            ;

MulExp      : UnaryExp                                                  { $$ = New_node("MulExp", 1, $1); }
            | MulExp MUL UnaryExp                                       { $$ = New_node("MulExp", 3, $1, $2, $3); }
            | MulExp DIV UnaryExp                                       { $$ = New_node("MulExp", 3, $1, $2, $3); }
            | MulExp MOD UnaryExp                                       { $$ = New_node("MulExp", 3, $1, $2, $3); }
            ;

AddExp      : MulExp                                                    { $$ = New_node("AddExp", 1, $1); }
            | AddExp ADD MulExp                                         { $$ = New_node("AddExp", 3, $1, $2, $3); }
            | AddExp SUB MulExp                                         { $$ = New_node("AddExp", 3, $1, $2, $3); }
            ;

RelExp      : AddExp                                                    { $$ = New_node("RelExp", 1, $1); }
            | RelExp LE AddExp                                          { $$ = New_node("RelExp", 3, $1, $2, $3); }
            | RelExp LT AddExp                                          { $$ = New_node("RelExp", 3, $1, $2, $3); }
            | RelExp GE AddExp                                          { $$ = New_node("RelExp", 3, $1, $2, $3); }
            | RelExp GT AddExp                                          { $$ = New_node("RelExp", 3, $1, $2, $3); }
            ;

EqExp       : RelExp                                                    { $$ = New_node("EqExp", 1, $1); }
            | EqExp EQ RelExp                                           { $$ = New_node("EqExp", 3, $1, $2, $3); }
            | EqExp NEQ RelExp                                          { $$ = New_node("EqExp", 3, $1, $2, $3); }
            ;

LAndExp     : EqExp                                                     { $$ = New_node("LAndExp", 1, $1); }
            | LAndExp AND EqExp                                         { $$ = New_node("LAndExp", 3, $1, $2, $3); }
            ;

LOrExp      : LAndExp                                                   { $$ = New_node("LOrExp", 1, $1); }
            | LOrExp OR LAndExp                                         { $$ = New_node("LOrExp", 3, $1, $2, $3); }
            ;

%%
void yyerror(const char *s) {
    printf("error: %s\n", s);
}

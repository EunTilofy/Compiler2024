%{
#include <bits/stdc++.h>
// #include "tree.hpp"
using namespace std;
#define YYDEBUG 1
void yyerror(const char *s);
extern int yylex(void);
// Node* Root;
%}

// %union {
//    Node *NODE;
// }

%start ROOT
%token ADD SUB MUL DIV MOD ASSIGN EQ NEQ
%token LT LE GT GE AND OR NOT
%token SEMI COMMA
%token LPAREN "("
%token RPAREN ")"
%token LBRACKET "["
%token RBRACKET "]"
%token LBRACE "{"
%token RBRACE "}"
%token INT VOID IF ELSE WHILE RETURN BREAK CONTINUE
%token IDENT INTCONST

// non-terminal
// %type <NODE> ROOT CompUnit Decl BType VarDef VarDecl VarDefs
// %type <NODE> Widths InitVal InitVals FuncHead FuncDef FuncParams FuncParam
// %type <NODE> Block BlockItem BlockItems Stmt Exp Cond LVal LvalWidths UnaryExp
// %type <NODE> PrimaryExp Number UnaryOp FuncRParams MulExp AddExp RelExp EqExp LAndExp LOrExp
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%

ROOT        : CompUnit                                                  //{ $$ = New_node(@$.first_line, OTHER, "Root", 1, $1); Root = $$; }
            ;//
//
CompUnit    : Decl                                                      //{ $$ = New_node(@$.first_line, OTHER, "CompUnit", 1, $1); }
            | FuncDef                                                   //{ $$ = New_node(@$.first_line, OTHER, "CompUnit", 1, $1); }
            | CompUnit Decl                                             //{ $$ = New_node(@$.first_line, OTHER, "CompUnit", 2, $1, $2); }
            | CompUnit FuncDef                                          //{ $$ = New_node(@$.first_line, OTHER, "CompUnit", 2, $1, $2); }
            ;//
//
Decl        : VarDecl                                                   //{ $$ = New_node(@$.first_line, OTHER, "Decl", 1, $1); }
            ;//
//
BType       : INT                                                       //{ $$ = New_node(@$.first_line, OTHER, "BType", 1, $1); }        
            ;//
//
VarDef      : IDENT                                                     //{ $$ = New_node(@$.first_line, OTHER, "VarDef", 1, $1); }
            | IDENT Widths                                              //{ $$ = New_node(@$.first_line, OTHER, "VarDef", 2, $1, $2); }
            | IDENT ASSIGN InitVal                                      //{ $$ = New_node(@$.first_line, OTHER, "VarDef", 3, $1, $2, $3); }
            | IDENT Widths ASSIGN InitVal                               //{ $$ = New_node(@$.first_line, OTHER, "VarDef", 4, $1, $2, $3, $4); }
            ;//
//
VarDecl     : BType VarDef VarDefs SEMI                                 //{ $$ = New_node(@$.first_line, OTHER, "VarDecl", 4, $1, $2, $3, $4); }
            ;//
//
VarDefs     : VarDefs COMMA VarDef                                      //{ $$ = New_node(@$.first_line, OTHER, "VarDefs", 3, $1, $2, $3); }
            |                                                           //{ $$ = NULL; }
            ;//
//
Widths      : "[" INTCONST "]"                                          //{ $$ = New_node(@$.first_line, OTHER, "Widths", 3, $1, $2, $3); }
            | Widths "[" INTCONST "]"                                   //{ $$ = New_node(@$.first_line, OTHER, "Widths", 4, $1, $2, $3, $4); }
            ;//
//
InitVal     : Exp                                                       //{ $$ = New_node(@$.first_line, OTHER, "InitVal", 1, $1); }
            | "{"  "}"                                                  //{ $$ = New_node(@$.first_line, OTHER, "InitVal", 2, $1, $2); }
            | "{" InitVals "}"                                          //{ $$ = New_node(@$.first_line, OTHER, "InitVal", 3, $1, $2, $3); }
            ;//
//
InitVals    : InitVal                                                   //{ $$ = New_node(@$.first_line, OTHER, "InitVals", 1, $1); }
            | InitVals COMMA InitVal                                    //{ $$ = New_node(@$.first_line, OTHER, "InitVals", 3, $1, $2, $3); }
            ;//
//
FuncHead    : BType IDENT                                               //{ $$ = New_node(@$.first_line, OTHER, "FuncHead", 2, $1, $2); }
            | VOID IDENT                                                //{ $$ = New_node(@$.first_line, OTHER, "FuncHead", 2, $1, $2); }
            ;   //
//
FuncDef     : FuncHead "(" FuncParams ")" Block                         //{ $$ = New_node(@$.first_line, OTHER, "FucnDef", 5, $1, $2, $3, $4, $5); }
            | FuncHead "(" ")" Block                                    //{ $$ = New_node(@$.first_line, OTHER, "FucnDef", 4, $1, $2, $3, $4); }
            ;//
//
FuncParams  : FuncParam                                                 //{ $$ = New_node(@$.first_line, OTHER, "FuncParams", 1, $1); }
            | FuncParams COMMA FuncParam                                //  { $$ = New_node(@$.first_line, OTHER, "FuncParams", 3, $1, $2, $3); }
            ;//
//
FuncParam   : BType IDENT                                               //{ $$ = New_node(@$.first_line, OTHER, "FuncParam", 2, $1, $2); }  
            | BType IDENT "[" "]"                                       //{ $$ = New_node(@$.first_line, OTHER, "FuncParam", 4, $1, $2, $3, $4); }
            | BType IDENT "[" "]" Widths                                //{ $$ = New_node(@$.first_line, OTHER, "FuncParam", 5, $1, $2, $3, $4, $5); }
//
Block       : "{" "}"                                                   //{ $$ = New_node(@$.first_line, OTHER, "Block", 2, $1, $2); }
            | "{" BlockItems "}"                                        //{ $$ = New_node(@$.first_line, OTHER, "Block", 3, $1, $2, $3); }
            ;//
//
BlockItems  : BlockItem                                                 //{ $$ = New_node(@$.first_line, OTHER, "BlockItems", 1, $1); }       
            | BlockItems BlockItem                                      //{ $$ = New_node(@$.first_line, OTHER, "BlockItems", 2, $1, $2); }
            ;//
//
BlockItem   : Stmt                                                      //{ $$ = New_node(@$.first_line, OTHER, "BlockItem", 1, $1); }             
            | Decl                                                      //{ $$ = New_node(@$.first_line, OTHER, "BlockItem", 1, $1); }                     
            ;//
//
Stmt        : LVal ASSIGN Exp SEMI                                      //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 4, $1, $2, $3, $4); }
            | Exp SEMI                                                  //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 2, $1, $2); }
            | SEMI                                                      //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 1, $1); }                 
            | Block                                                     //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 1, $1); }
            | IF "(" Cond ")" Stmt %prec LOWER_THAN_ELSE                //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 5, $1, $2, $3, $4, $5); }
            | IF "(" Cond ")" Stmt ELSE Stmt                            //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 7, $1, $2, $3, $4, $5, $6, $7); }
            | WHILE "(" Cond ")" Stmt                                   //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 5, $1, $2, $3, $4, $5); }
            | RETURN SEMI                                               //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 2, $1, $2); }
            | RETURN Exp SEMI                                           //{ $$ = New_node(@$.first_line, OTHER, "Stmt", 3, $1, $2, $3); }
            ;//
//
Exp         : AddExp                                                    //{ $$ = New_node(@$.first_line, OTHER, "Exp", 1, $1); }                   
            ;//
//
Cond        : LOrExp                                                    //{ $$ = New_node(@$.first_line, OTHER, "Cond", 1, $1); }                  
            ;//
//
LVal        : IDENT                                                     //{ $$ = New_node(@$.first_line, OTHER, "LVal", 1, $1); }   
            | IDENT LvalWidths                                          //{ $$ = New_node(@$.first_line, OTHER, "LVal", 2, $1, $2); }
            ;//
//
LvalWidths  : "[" Exp "]"                                               //{ $$ = New_node(@$.first_line, OTHER, "LvalWidths", 1, $1); }
            | LvalWidths "[" Exp "]"                                    //{ $$ = New_node(@$.first_line, OTHER, "LvalWidths", 1, $1); }
//
PrimaryExp  : "(" Exp ")"                                               //{ $$ = New_node(@$.first_line, OTHER, "PrimaryExp", 3, $1, $2, $3); }
            | LVal                                                      //{ $$ = New_node(@$.first_line, OTHER, "PrimaryExp", 1, $1); }          
            | Number                                                    //{ $$ = New_node(@$.first_line, OTHER, "PrimaryExp", 1, $1); }         
            ;//
//
Number      : INTCONST                                                  //{ $$ = New_node(@$.first_line, OTHER, "Number", 1, $1); }           
            ;//
//
UnaryExp    : PrimaryExp                                                //{ $$ = New_node(@$.first_line, OTHER, "UnaryExp", 1, $1); }      
            | IDENT "(" ")"                                             //{ $$ = New_node(@$.first_line, OTHER, "UnaryExp", 3, $1, $2, $3); }   
            | IDENT "(" FuncRParams ")"                                 //{ $$ = New_node(@$.first_line, OTHER, "UnaryExp", 4, $1, $2, $3, $4); }   
            | UnaryOp UnaryExp                                          //{ $$ = New_node(@$.first_line, OTHER, "UnaryExp", 2, $1, $2); } 
            ;//
//
UnaryOp     : ADD                                                       //{ $$ = New_node(@$.first_line, OTHER, "UnaryOp", 1, $1); } 
            | SUB                                                       //{ $$ = New_node(@$.first_line, OTHER, "UnaryOp", 1, $1); }       
            | NOT                                                       //{ $$ = New_node(@$.first_line, OTHER, "UnaryOp", 1, $1); }
            ;//
//
FuncRParams : Exp                                                       //{ $$ = New_node(@$.first_line, OTHER, "FuncRParams", 1, $1); }  
            | FuncRParams COMMA Exp                                     //  { $$ = New_node(@$.first_line, OTHER, "FuncRParams", 3, $1, $2, $3); }
            ;//
//
MulExp      : UnaryExp                                                  //{ $$ = New_node(@$.first_line, OTHER, "MulExp", 1, $1); }
            | MulExp MUL UnaryExp                                       //{ $$ = New_node(@$.first_line, OTHER, "MulExp", 3, $1, $2, $3); }
            | MulExp DIV UnaryExp                                       //{ $$ = New_node(@$.first_line, OTHER, "MulExp", 3, $1, $2, $3); }
            | MulExp MOD UnaryExp                                       //{ $$ = New_node(@$.first_line, OTHER, "MulExp", 3, $1, $2, $3); }
            ;//
//
AddExp      : MulExp                                                    //{ $$ = New_node(@$.first_line, OTHER, "AddExp", 1, $1); }
            | AddExp ADD MulExp                                         //{ $$ = New_node(@$.first_line, OTHER, "AddExp", 3, $1, $2, $3); }
            | AddExp SUB MulExp                                         //{ $$ = New_node(@$.first_line, OTHER, "AddExp", 3, $1, $2, $3); }
            ;//
//
RelExp      : AddExp                                                    //{ $$ = New_node(@$.first_line, OTHER, "RelExp", 1, $1); }
            | RelExp LE AddExp                                          //{ $$ = New_node(@$.first_line, OTHER, "RelExp", 3, $1, $2, $3); }
            | RelExp LT AddExp                                          //{ $$ = New_node(@$.first_line, OTHER, "RelExp", 3, $1, $2, $3); }
            | RelExp GE AddExp                                          //{ $$ = New_node(@$.first_line, OTHER, "RelExp", 3, $1, $2, $3); }
            | RelExp GT AddExp                                          //{ $$ = New_node(@$.first_line, OTHER, "RelExp", 3, $1, $2, $3); }
            ;//
//
EqExp       : RelExp                                                    //{ $$ = New_node(@$.first_line, OTHER, "EqExp", 1, $1); }
            | EqExp EQ RelExp                                           //{ $$ = New_node(@$.first_line, OTHER, "EqExp", 3, $1, $2, $3); }
            | EqExp NEQ RelExp                                          //{ $$ = New_node(@$.first_line, OTHER, "EqExp", 3, $1, $2, $3); }
            ;//
//
LAndExp     : EqExp                                                     //{ $$ = New_node(@$.first_line, OTHER, "LAndExp", 1, $1); }
            | LAndExp AND EqExp                                         //{ $$ = New_node(@$.first_line, OTHER, "LAndExp", 3, $1, $2, $3); }
            ;//
//
LOrExp      : LAndExp                                                   //{ $$ = New_node(@$.first_line, OTHER, "LOrExp", 1, $1); }
            | LOrExp OR LAndExp                                         //{ $$ = New_node(@$.first_line, OTHER, "LOrExp", 3, $1, $2, $3); }
            ;//
//
%%

void yyerror(const char *s) {
    printf("error: %s\n", s);
}

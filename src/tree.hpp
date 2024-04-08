#ifndef TREE_HPP
#define TREE_HPP

#include <bits/stdc++.h>
#define LEN 64
#define MAX_SON 8

enum MYTYPE
{
    SYMBOL,
    TOKEN,
    TERMINAL,
    OTHER,
    INT_TYPE,
    ID_TML,
    INT_TML,
};

struct Node
{
    std::string name, text;
    int type, lineno;
    struct Node* sons[MAX_SON];
    int NUM_SON;
    Node() : type(0), lineno(0), NUM_SON(0) { }
};

Node* New_word(std::string name, char* text, MYTYPE type, int lineno);

Node* New_node(int lineno, int type, std::string name, int size, ...);

void Print_Tree(Node* root, int depth);

#endif
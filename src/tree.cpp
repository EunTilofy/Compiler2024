#include <bits/stdc++.h>
using namespace std;
#include "tree.hpp"

Node* New_word(std::string name, char* text, MYTYPE type, int lineno)
{
    Node* new_node = new Node;
    new_node->name = name;
    new_node->text = text;
    new_node->type = type;
    new_node->lineno = lineno;
    return new_node;
}

Node* New_node(int lineno, int type, std::string name, int size, ...)
{
    Node* new_node = new Node;
    new_node->type = OTHER;
    new_node->name = name;
    new_node->lineno = lineno;
    new_node->NUM_SON = size;
    va_list ap;
    va_start(ap, size);
    for(int i = 0; i < size; ++i)
    {
        new_node->sons[i] = va_arg(ap, Node*);
    }
    va_end(ap);
    return new_node;
}
void Print_Tree(Node* root, int depth)
{
    if(!root) return;
    for(int i = 0; i < depth; ++i) printf("    ");
    std::cout << root->name;
    switch (root->type)
    {
    case OTHER:
        std::cout << " (" << root->lineno << ")\n";
        break;
    case TERMINAL:
        std::cout << "\n";
        break;
    case ID_TML:
        std::cout << ": " << root->text << "\n";
        break;
    case INT_TML:
        std::cout << ": " << root->text << "\n";
        break;
    case INT_TYPE:
        std::cout << ": " << root->text << "\n";
    default:
        std::cout << " (" << root->text << ")\n";
    }
    for(int i = 0; i < root->NUM_SON; ++i)
        Print_Tree(root->sons[i], depth + 1);
}
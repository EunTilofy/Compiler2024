#include "tree.hpp"

Node * Root;

Node* New_word(std::string type, char* text) { return new Node(type, text); }

Node* New_node(std::string type, int size, ...)
{
    Node* new_node = new Node(type);
    va_list ap;
    va_start(ap, size);
    for(int i = 0; i < size; ++i) new_node->add_child(va_arg(ap, Node*));
    va_end(ap);
    return new_node;
}
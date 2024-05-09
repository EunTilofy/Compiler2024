#ifndef TREE_HPP
#define TREE_HPP

#include <bits/stdc++.h>
using namespace std;

extern int yylineno;

class Type // to recognize variables and functions
{
public:
    bool isfunc;
    string type;
    vector<Type> args; // if it is a function, it will have params
    deque<int> wid; // width for array

public:
    bool has_value() { return type != ""; }
    Type() {}
    Type(bool isfunc, string type) : isfunc(isfunc), type(type) {}
    template <typename... Args>
    bool operator==(const Type&o) const 
    {
        if(type != o.type || wid.size() != o.wid.size() || args.size() != o.args.size()) return 0;
        for(int i = 1; i < wid.size(); ++i) if(wid[i] != o.wid[i]) return 0;
        for(int i = 0; i < args.size(); ++i) if(args[i] != o.args[i]) return 0;
        return 1;
    }
    bool operator!=(const Type &o) const { return !(*this == o); }
    bool operator<(const Type &o) const
    {
        if (type != o.type) return type < o.type;
        if (wid.size() != o.wid.size()) return wid.size() < o.wid.size();
        if (args.size() != o.args.size()) return args.size() < o.args.size();
        for(int i = 1; i < wid.size(); i++) if (wid[i] != o.wid[i]) return wid[i] < o.wid[i];
        for (int i = 0; i < args.size(); i++) if (args[i] != o.args[i]) return args[i] < o.args[i];
        return 0;
    }
};

class Node
{
public:
    string type, text;
    int val;
    vector<Node*> child;
    Type ret_type, exp_type;
    Node() {}
    Node(string type) : type(type) {}
    Node(string type, string text) : type(type), text(text)
    {
        if(type == "INTCONST")
        {
            stringstream ss(text);
            ss >> val;
        }
    }

    template <class ... Args>
    Node* add_child(Args... args)
    {
        (..., child.push_back(args));
        return this;
    }

    void get_value(Node* o) { for (auto c : o->child) child.push_back(c); }
    void print(int layer)
    {
        cerr << string(layer, '.');
        cerr << type;
        if(child.size() == 0) cerr << " " << text;
        cerr << '\n';
        for(auto &c : child)  c->print(layer+1);
    }
};

Node* New_word(string type, char* text);

Node* New_node(string type, int size, ...);

#endif
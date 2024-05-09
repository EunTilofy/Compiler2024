#ifndef SEMANTIC_HPP
#define SEMANTIC_HPP

#include<bits/stdc++.h>
using namespace std;
#include "tree.hpp"

#define DEBUG(msg) \
    std::cerr << "DEBUG: " << msg << " at " << __FILE__ << ":" << __LINE__ << std::endl;


class Checker
{
public:
    int num_var;
    map<int, Type> get_type;
    map<string, stack<int>> get_var; // get the position of the variable in the stack
    Checker() : num_var(0), layer(-1000)
    { // read and write 
        register_var("read", Type(1, "INT"));
        Type _(1, "VOID"); _.args.push_back(Type(0, "INT"));
        register_var("write", _); 
    }
    void register_var(string name, Type type)
    {
        get_type[++num_var] = type;
        get_var[name].push(num_var);
    }

    int check(Node* o, int L = 0)
    {
        if(o->type == "Block") return check_Block(o, L);
        if(o->type == "IfElse") return check_ifelse(o, L);
        if(o->type == "If" || o->type == "While") return check_ifwhile(o, L);
        if(o->type == "VarDecl") return check_vardecl(o, L);
        if(o->type == "CompUnit") 
        {
            for(auto &x : o->child)
                if(!check(x, x->type=="Decl"?0:L)) { DEBUG("type error"); return 0;}
            return 1;
        }
        if(o->type == "INTCONST") { o->exp_type = Type(0, "INT"); return 1; }
        if(o->type == "PrimaryExp")
        {
            if(!check(o->child[0], L)) { DEBUG("type error"); return 0;}
            o->exp_type = o->child[0]->exp_type;
            return 1;
        }
        if(o->type == "Return")
        {
            if(!o->child.size()) o->ret_type = Type(0, "VOID");
            else 
            {
                if(!check(o->child[0], L)) { DEBUG("type error"); return 0;}
                o->ret_type = o->child[0]->exp_type;
            }
            return 1;
        }
        if(o->type == "InitVal") return check_initval(o, L);
        if(o->type == "InitVals")
        {
            set<Type> _;
            for(auto &x : o->child)
            {
                if(!check(x, L)) { DEBUG("type error"); return 0;}
                _.insert(Type(0, x->exp_type.type));
            }
            if(_.size() > 1) { DEBUG("type error"); return 0;}
            if(_.size() == 1) o->exp_type = *_.begin();
            return 1;
        }
        if(o->type == "UnaryExp")
        {
            if(o->child.size() == 1)
            {
                if(!check(o->child[0], L)) { DEBUG("type error"); return 0;}
                o->exp_type = o->child[0]->exp_type;
            }
            else
            {
                if(!check(o->child[1], L)) { DEBUG("type error"); return 0;}
                Type type = o->child[1]->exp_type;
                if(type.type != "INT") { DEBUG("type error"); return 0;}
                o->exp_type = type;
            }
            return 1;
        }
        if(o->type == "AddExp" || o->type == "MulExp" || o->type == "RelExp" 
        || o->type == "EqExp" || o->type == "LAndExp" || o->type == "LOrExp") return check_exp(o, L);
        if(o->type == "FuncCall") return check_funccall(o, L);
        if(o->type == "FuncParam") return check_funcparam(o, L);
        if(o->type == "FuncDef") return check_funcdef(o, L);
        if(o->type == "LVal") return check_lval(o, L);
        if(o->type == "Assign")
        {
            Node* Lval = o->child[0];
            if(!check(Lval, L)) { DEBUG("type error"); return 0;}
            Type type = Lval->exp_type;
            if(type.wid.size() > 0) { DEBUG("type error"); return 0;}
            if(!check(o->child[1], L)) { DEBUG("type error"); return 0;}
            Type Rval = o->child[1]->exp_type;
            if(Rval != type) { DEBUG("type error"); return 0;}
            return 1;
        }
        for(auto &x : o->child) if(!check(x, L)) { DEBUG("type error"); return 0;}
        return 1;
    }
    int layer;
    int num[105];
    int calc_sum = 0;
    int check_initval(Node* o, int L)
    {
        ++layer;
        if (!o->child.size())
        {
            Type type(0, "INT");
            type.wid.push_back(0);
            o->exp_type = type;
        }
        else if (o->child[0]->type == "InitVals")
        {
            if(!check(o->child[0], L)) { DEBUG("type error"); return 0;}
            o->exp_type = o->child[0]->exp_type;
            o->exp_type.wid.push_back(o->child[0]->child.size());
        }
        else
        {
            if(!check(o->child[0], L)) { DEBUG("type error"); return 0;}
            o->exp_type = o->child[0]->exp_type;
        }
        --layer;
        
        if(layer >= 0) 
        {
            num[layer] = 1;
            if(layer == 0)
            {
                int mx = 0;
                for(int i = 1; i < 100; ++i) if(num[i]) mx = i, num[i] = 0;
                calc_sum += widths[mx];
            }
        }
        return 1;
    }
    int check_Block(Node* o, int L, bool modify = 1)
    {
        if(modify) L = num_var;
        set<Type> ret;
        for(auto &x : o->child) {
            if(!check(x, L)) { DEBUG("type error"); return 0;}
            if(x->ret_type.has_value()) ret.insert(x->ret_type);
        }
        if(ret.size() > 1) { DEBUG("type error"); return 0;}  // duplicate ret_type
        if(ret.size() == 1) { o->ret_type = *ret.begin(); }
        for(auto &[_, t] : get_var) 
            if(t.size() && t.top() > L && !get_type[t.top()].isfunc) t.pop();
        return 1;
    }
    int check_ifelse(Node* o, int L)
    {
        for(auto &x : o->child)
            if(!check(x, L)) { DEBUG("type error"); return 0;}
        set<Type> ret;
        for(int i = 1; i < o->child.size(); ++i)
            if(o->child[i]->ret_type.has_value())
                ret.insert(o->child[i]->ret_type);
        if(ret.size() > 1) { DEBUG("type error"); return 0;}
        o->ret_type = o->child[1]->ret_type;
        return 1;
    }
    int check_ifwhile(Node* o, int L)
    {
        for(auto &x : o->child)
            if(!check(x, L)) { DEBUG("type error"); return 0;}
        o->ret_type = o->child[1]->ret_type;
        return 1;
    }

    deque<int> widths; // used for array definition checks

    int check_vardecl(Node* o, int L)
    {
        string vartype = o->child[0]->type;
        for(int i = 1; i < o->child.size(); ++i)
        {
            Node* def = o->child[i];
            Node* ident = def->child[0];
            if (!get_var.count(ident->text))
                get_var[ident->text] = stack<int>();
            else if (get_var[ident->text].size() && get_var[ident->text].top() > L) { DEBUG("type error"); return 0; }
            if (L == 0) ident->val = -num_var-1;
            else ident->val = num_var + 1;
            get_var[ident->text].push(ident->val);
            Type type = Type(0, vartype);
            int all = 1; calc_sum = 0;
            for(int ii=0; ii<100; ++ii) num[ii] = 0;
            if (def->type == "ArrayDef")
            {
                for (auto wid : def->child[1]->child) type.wid.push_back(wid->val), all *= wid->val;
            }
            widths = type.wid;
            reverse(widths.begin(), widths.end());
            widths.push_front(1);
            for(int i = 1; i < widths.size(); ++i) widths[i] = widths[i-1] * widths[i];
            // std::cerr << "all = " << all << "\n";
            register_var(ident->text, type);
            // std::cerr << L << " " << ident->text << " " << type.type << " register !\n";
            Node *initval = def->child.back();
            if(initval->type != "InitVal") continue;
            layer = -1;
            if(!check_initval(initval, L)) { DEBUG("type error"); return 0;}
            layer = -1000;
            Type init_type = initval->exp_type;
            if(init_type != type && def->type == "VarDef") { DEBUG("type error"); return 0;}
            if(def->type == "ArrayDef" && !init_type.wid.size()) { DEBUG("type error"); return 0;}
            // check === Excess elements in array initializer
            if(def->type == "ArrayDef" && calc_sum > all) { 
                std::cerr << calc_sum << "\n";
                DEBUG("type error"); return 0; 
            }
        }
        return 1;
    }
    int check_lval(Node* o, int L)
    {
        Node *ident = o->child[0];
        if (!get_var.count(ident->text)) { 
            std::cerr << ident->text << " : Not found!\n";
            DEBUG("type error"); return 0;
        }
        int id = get_var[ident->text].top();
        ident->val = id;
        Type type = get_type[abs(id)];
        if (o->child.size() > 1)
        {
            Node *arr_wid = o->child[1];
            if (type.wid.size() < arr_wid->child.size()) { DEBUG("type error"); return 0;}
            for (int i = 0; i < arr_wid->child.size(); ++i) type.wid.pop_front();
            for (int i = 0; i < arr_wid->child.size(); ++i)
            {
                if(!check(arr_wid->child[i], L)) { DEBUG("type error"); return 0;}
                Type index_type = arr_wid->child[i]->exp_type;
                if (index_type.type != "INT" || index_type.wid.size() || index_type.isfunc) { DEBUG("type error"); return 0;}
            }
        }
        o->exp_type = type;
        return 1;
    }
    int check_funcdef(Node* o, int L)
    {
        L = num_var;
        Node *ident = o->child[1];
        if(get_var.count(ident->text)) { DEBUG("type error"); return 0;}
        Type _type = Type(0, o->child[0]->type);
        Type func_type = Type(0, o->child[0]->type);
        func_type.isfunc = 1;
        Node *args = o->child[2];
        for (int i = 0; i < args->child.size(); i++)
        {
            Node *arg = args->child[i];
            if(!check(arg, L)) { DEBUG("type error"); return 0;}
            Type arg_type = arg->exp_type;
            func_type.args.push_back(arg_type);
        }
        ident->val = num_var+1;
        register_var(ident->text, func_type);
        if(o->child.back()->type != "Block") { DEBUG("type error"); return 0;}
        if(!check_Block(o->child.back(), L, 0)) { DEBUG("type error"); return 0;}
        Type ret_type = o->child.back()->ret_type;
        if (ret_type.has_value() && ret_type != _type) { DEBUG("type error"); return 0;}
        for (auto &[_, t] : get_var)
        {
            // std::cerr << t.top() << "\n";
            if (t.size() && t.top() > L && !get_type[t.top()].isfunc) t.pop();
        }
        return 1;
    }
    int check_funcparam(Node* o, int L)
    {
        Node *ident = o->child[1];
        Type type = Type(0, o->child[0]->type);
        for(int i = 2; i < o->child.size(); i++)
            type.wid.push_back(o->child[i]->val);
        o->exp_type = type;
        if(!get_var.count(ident->text))
            get_var[ident->text] = stack<int>();
        else if (get_var[ident->text].size() && get_var[ident->text].top() > L) { DEBUG("type error"); return 0;}

        // std::cerr << num_var << " " << ident->text << " " << type.type << " register !\n";

        register_var(ident->text, type);
        // std::cerr << "Add var : " << ident->text << "\n";
        ident->val = num_var;
        return 1;
    }
    int check_exp(Node* o, int L)
    {
        if(o->child.size() == 1)
        {
            if(!check(o->child[0], L)) { DEBUG("type error"); return 0;}
            o->exp_type = o->child[0]->exp_type;
        }
        else
        {
            if(!check(o->child[0], L)) { DEBUG("type error"); return 0;}
            if(!check(o->child[2], L)) { DEBUG("type error"); return 0;}
            if (o->child[0]->exp_type != o->child[2]->exp_type) { DEBUG("type error"); return 0;}
            if (o->child[0]->exp_type.type != "INT") { DEBUG("type error"); return 0;}
            o->exp_type = o->child[0]->exp_type;
        }
        return 1;
    }
    int check_funccall(Node* o, int L)
    {
        Node *ident = o->child[0];
        if(!get_var.count(ident->text)) { DEBUG("type error"); return 0;}
        int id = get_var[ident->text].top();
        ident->val = id;
        Type type = get_type[id];
        if(!type.isfunc) { DEBUG("type error"); return 0;}
        Node *args = o->child[1];
        if(args->child.size() != type.args.size()) { DEBUG("type error"); return 0;}
        for(int i = 0; i < args->child.size(); ++i)
        {
            if(!check(args->child[i], L)) { DEBUG("type error"); return 0;}
            Type arg_type = args->child[i]->exp_type;
            if (arg_type != type.args[i]) { DEBUG("type error"); return 0; }
        }
        o->exp_type = Type(0, type.type);
        return 1;
    }
};

#endif
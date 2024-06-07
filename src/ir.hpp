#ifndef __IR_HPP
#define __IR_HPP

#include <bits/stdc++.h>
using namespace std;
#include "semantic.hpp"
#include "tree.hpp"

#define all(x) (x).begin(), (x).end()
void ___dbg(){std::cerr << std::endl;}
template<typename T, typename... Args>
void ___dbg(T first, Args... args) {std::cerr << first << " ";___dbg(args...);}
#define dbg(...) { std::cerr << "DEBUG at Line " << __LINE__ << " : "; ___dbg(__VA_ARGS__); }

#define elif else if
#define BREAK {std::cerr <<  __FILE__ << ":" << __LINE__ << std::endl; exit(0); }
#define INFO(type, ...) (new info_##type(__VA_ARGS__))
#define _IR(type, ...) IR(new info_##type(__VA_ARGS__))

/************ IR_INFO (for one sentence) TO OUTPUT *************/

string upd_op(string op)
{
    if(op == "+" || op == "-" || op == "*" || op == "/" || op == "%" 
    || op == ">" || op == ">=" || op == "<" || op == "<=" || op == "!="
    || op == "==") return op;
    if(op == "ADD") return "+"; if(op == "MOD") return "%";  if(op == "GE")  return ">=";
    if(op == "SUB") return "-"; if(op == "LT")  return "<";  if(op == "NEQ") return "!=";
    if(op == "MUL") return "*"; if(op == "LE")  return "<="; if(op == "EQ")  return "==";
    if(op == "DIV") return "/"; if(op == "GT")  return ">"; 
    if(op == "NEG") return "-";
    return "##ERROR##";
}

class IR_info
{ 
public:
    string type;
    virtual ~IR_info() {}
    virtual IR_info* clone() const { return new IR_info(); }
    virtual void print(ostream &OUT) const
    {
        OUT << "[ERROR] print function not defined!\n";
    }
};

class info_global : public IR_info
{
public:
    IR_info* clone() const { return new info_global(*this); }
    string name;
    info_global(string name) : name(name) { IR_info::type = "GLOBAL"; }
    void print(ostream &OUT) const { OUT << "GLOBAL " << name << ":\n"; }
};

class info_word : public IR_info
{
public:
    IR_info* clone() const { return new info_word(*this); }
    int val;
    info_word(int val) : val(val) { IR_info::type = "WORD"; }
    void print(ostream &OUT) const { OUT << ".WORD #" << val << "\n"; }
};

class info_assign_const : public IR_info
{
public:
    IR_info* clone() const { return new info_assign_const(*this); }
    string lv; int rv;
    info_assign_const(string lv, int rv) : lv(lv), rv(rv) { IR_info::type = "ASSIGN const"; }
    void print(ostream& OUT) const { OUT << lv << " = #" << rv << "\n"; }
};

class info_assign : public IR_info
{
public:
    IR_info* clone() const { return new info_assign(*this); }
    string lv, rv;
    info_assign(string lv, string rv) : lv(lv), rv(rv) { IR_info::type = "ASSIGN"; }
    void print(ostream& OUT) const { OUT << lv << " = " << rv << "\n"; }
};

class info_assign_addr : public IR_info
{
public:
    IR_info* clone() const { return new info_assign_addr(*this); }
    string lv, rv;
    info_assign_addr(string lv, string rv) : lv(lv), rv(rv) { IR_info::type = "ASSIGN addr"; }
    void print(ostream& OUT) const { OUT << lv << " = &" << rv << "\n"; }
};

class info_assign_load : public IR_info
{
public:
    IR_info* clone() const { return new info_assign_load(*this); }
    string lv, rv;
    info_assign_load(string lv, string rv) : lv(lv), rv(rv) { IR_info::type = "ASSIGN load"; }
    void print(ostream& OUT) const { OUT << lv << " = *" << rv << "\n"; }
};

class info_assign_store : public IR_info
{
public:
    IR_info* clone() const { return new info_assign_store(*this); }
    string lv, rv;
    info_assign_store(string lv, string rv) : lv(lv), rv(rv) { IR_info::type = "ASSIGN store"; }
    void print(ostream& OUT) const { OUT << "*" << lv << " = " << rv << "\n"; }
};

class info_assign_unary : public IR_info
{
public:
    IR_info* clone() const { return new info_assign_unary(*this); }
    string lv, op, rv;
    info_assign_unary(string lv, string op, string rv) : lv(lv), op(op), rv(rv) { IR_info::type = "ASSIGN unary"; }
    void print(ostream& OUT) const { OUT << lv << " = " << (upd_op(op)+" "+rv) << "\n"; }
};

class info_assign_binary : public IR_info
{
public:
    IR_info* clone() const { return new info_assign_binary(*this); }
    string lv, v1, op, v2;
    info_assign_binary(string lv, string v1, string op, string v2) : lv(lv), v1(v1), op(op), v2(v2) { IR_info::type = "ASSIGN binary"; }
    void print(ostream &OUT) const { OUT << lv << " = " << (v1+" "+upd_op(op)+" "+v2) << "\n"; }
};


class info_dec : public IR_info
{
public:
    IR_info* clone() const { return new info_dec(*this); }
    string name; int siz;
    info_dec(string name, int siz) : name(name), siz(siz) { IR_info::type = "DEC"; }
    void print(ostream &OUT) const { OUT << "DEC " << name << " #" << siz << "\n"; }
};

class info__return : public IR_info
{
public:
    IR_info* clone() const { return new info__return(*this); }
    string v;
    info__return(string v = "") : v(v) { IR_info::type = "RETURN"; }
    void print(ostream &OUT) const { OUT << "RETURN " << v << "\n"; }
};

class info_arg : public IR_info
{
public:
    IR_info* clone() const { return new info_arg(*this); }
    string name;
    info_arg(string name) : name(name) { IR_info::type = "ARG"; }
    void print(ostream &OUT) const { OUT << "ARG " << name << "\n"; }
};

class info_param : public IR_info
{
public:
    IR_info* clone() const { return new info_param(*this); }
    string name;
    info_param(string name) : name(name) { IR_info::type = "PARAM"; }
    void print(ostream &OUT) const { OUT << "PARAM " << name << "\n"; }
};

class info_call : public IR_info
{
public:
    IR_info* clone() const { return new info_call(*this); }
    string name;
    info_call(string name) : name(name) { IR_info::type = "CALL"; }
    void print(ostream &OUT) const { OUT << "CALL " << name << "\n"; }
};

class info_assign_call : public IR_info
{
public:
    IR_info* clone() const { return new info_assign_call(*this); }
    string lv, name;
    info_assign_call(string lv, string name) : lv(lv), name(name) { IR_info::type = "ASSIGN call"; }
    void print(ostream &OUT) const { OUT << lv << " = CALL " << name << "\n"; }
};

class info_function : public IR_info
{
public:
    IR_info* clone() const { return new info_function(*this); }
    string name;
    info_function(string name) : name(name) { IR_info::type = "FUNCTION"; }
    void print(ostream &OUT) const { OUT << "FUNCTION " << name << " : \n"; }
};

class info__goto : public IR_info
{
public:
    IR_info* clone() const { return new info__goto(*this); }
    string name;
    info__goto(string name) : name(name) { IR_info::type = "GOTO"; }
    void print(ostream &OUT) const { OUT << "GOTO  " << name << "\n"; }
};

class info_ifgt : public IR_info
{
public:
    IR_info* clone() const { return new info_ifgt(*this); }
    string v1, op, v2, name;
    info_ifgt(string v1, string op, string v2, string name):
    v1(v1), op(op), v2(v2), name(name) { IR_info::type = "IFGT"; }
    void print(ostream &OUT) const { OUT << ("IF "+v1+" "+upd_op(op)+" "+v2+" GOTO "+name) << "\n"; }
};

class info_label : public IR_info
{
public:
    IR_info* clone() const { return new info_label(*this); }
    string name;
    info_label(string name) : name(name) { IR_info::type = "LABEL"; }
    void print(ostream &OUT) const { OUT << "LABEL " << name << " :\n"; }
};



/************ IR_NODE *************/


class IR
{
public:
    string type;
    unique_ptr<IR_info> info;
    vector<IR> child;

    IR() : info(nullptr) { type = "NULL"; }
    IR(IR_info *o) : type(o->type), info(unique_ptr<IR_info>(o)) { }
    IR(const IR& o) : type(o.type), info(o.info ? o.info->clone() : nullptr), child(o.child) {}

    IR& operator=(const IR& o) {
        if (this != &o) {
            type = o.type;
            info = unique_ptr<IR_info>(o.info ? o.info->clone() : nullptr);
            child = o.child;
        }
        return *this;
    }

    void merge(const IR& o) 
    {
        if (type != "NULL")
        {
            IR new_ir = *this;
            info = nullptr;
            child.push_back(new_ir);
        }
        if (o.type != "NULL") child.emplace_back(o);
        else for (const auto& e : o.child) child.emplace_back(e);
        type = "NULL";
    }
    template<typename... Args>
    void _with(Args... args)
    {
        (this->merge(args), ...);
    }
    
    void print(ostream &OUT) const
    {
        if(type != "NULL") info->print(OUT);
        for(const auto &e : child)
        {
            if(e.type != "LABEL" && e.type != "FUNCTION" && e.type != "GLOBAL")
                OUT << string(4, ' ');
            e.print(OUT);
        }
    }
    
    int num_var;
    map<int, Type> get_type;
    map<string, stack<int>> get_var;

    string get_label() { static int tot = 0; ++tot; return "L"+to_string(tot); }
    string get_tmp() { static int tot = 0; ++tot; return "irt3mP"+to_string(tot); }
    string get_name(Node* o) { return "irVar_xxx"+to_string(abs(o->val))+"_"+o->text; }

    IR(Checker *checker, Node* o) : IR()
    {
        num_var = checker->num_var;
        get_type = checker->get_type;
        get_var = checker->get_var;
        for(auto e : o->child)
        {
            if(e->type == "FuncDef") this->merge(from_func(e));
            else this->merge(from_decl(e));
        }
    }

    IR from_func(Node *o)
    {
        IR rt;
        if(o->type != "FuncDef") { DEBUG("generate ir error"); return rt; }
        rt.merge(_IR(function, o->child[1]->text));
        for (auto arg : o->child[2]->child)
            rt.merge(_IR(param, get_name(arg->child[1])));
        rt.merge(_IR(assign_const, "zero", 0));
        rt.merge(from_stmt(o->child[3]));
        return rt;
    }

    IR from_decl(Node *o, bool _inline = 0)
    {
        IR rt;
        Node* Var = o->child[0];
        for(auto e = next(Var->child.begin()); e != Var->child.end(); ++e)
        {
            Node *_ = *e, *id = _->child[0];
            string tmp = get_name(id);
            if(!_inline) rt.merge(_IR(global, tmp));
            if (_->type == "VarDef")
            {
                if(_inline)
                {
                    if(_->child.size() > 1)
                        rt.merge(from_exp(_->child[1], tmp));
                }
                else
                {
                    rt.merge(_IR(word, ((_->child.size() > 1 ? 
                    _->child[1]->child[0]->child[0]->child[0]->child[0]->child[0]->val : 0))));
                }
            }
            else
            {
                Type type = get_type[abs(id->val)];
                int siz = accumulate(all(type.wid), 1, std::multiplies<int>());
                vector<int> initv(siz, 0);
                if(_inline) rt.merge(_IR(dec, tmp, siz * 4));
                if(_->child.size() > 2) fill_initv(_->child[2], initv, siz, type, _inline, rt, tmp);
                if(!_inline) for(int i = 0; i < siz; ++i) rt.merge(_IR(word, initv[i]));
            }
        }
        return rt;
    }

    void fill_initv(Node* o, vector<int>& a, int siz, Type type, bool _inline, IR &rt, string t1)
    {
        function<void(Node*, vector<int>&, int)> dfs = [&](Node* oo, vector<int> &index, int dep)
        {
            if(oo->type == "InitVals")
            {
                // cerr << "check in ~~\n";
                vector<int> tmp = index;
                if(_inline)
                {
                    int sz = accumulate(type.wid.begin()+dep, type.wid.end(), 1, multiplies<int>());
                    string t = get_tmp();
                    rt.merge(_IR(assign, t, t1));
                    for(int i = 0; i < index.size(); ++i)
                    {
                        string tt = get_tmp();
                        int siz = accumulate(type.wid.begin()+i+1, type.wid.end(), 1, multiplies<int>());
                        rt._with(_IR(assign_const, tt, index[i]*siz*4), _IR(assign_binary, t, t, "+", tt));
                    }
                    for(int i = 0; i < sz; ++i)
                    {
                        string tt = get_tmp();
                        rt._with(_IR(assign_store, t, "zero"), _IR(assign_const, tt, 4), _IR(assign_binary, t, t, "+", tt));
                    }
                }
                for(auto &e : oo->child) dfs(e->child[0], index, dep + 1);
                index = tmp;
                for(int i = dep - 1; ~i; --i)
                    if(++index[i] >= type.wid[i]) index[i] = 0;
                    else break;
            } else
            {
                string t2 = "", t = "";
                if(_inline)
                {
                    t2 = get_tmp(), t = get_tmp();
                    rt._with(from_exp(oo, t2), _IR(assign, t, t1));
                }
                Node* num = nullptr; int val = 0;
                if(!_inline) num = oo->child[0]->child[0]->child[0]->child[0],
                             val = num->val;
                int pos = 0, j = 0;
                for(int i : index)
                {
                    int xx = accumulate(type.wid.begin()+j+1, type.wid.end(), 1, multiplies<int>());
                    ++j;
                    pos += i * xx;
                    string tt = get_tmp();
                    if(_inline) rt._with(_IR(assign_const, tt, 4*xx*i), _IR(assign_binary, t, t, "+", tt));
                }
                a[pos] = val;
                if(_inline) rt.merge(_IR(assign_store, t, t2));
                for(int i = index.size() - 1; ~i; --i)
                {
                    if(++index[i] >= type.wid[i]) index[i] = 0;
                    else break;
                }
            }
        };
        for(auto &e : o->child)
        { 
            // cerr << type.wid.size() << "\n";
            // for(auto num : type.wid) cerr << num << "\n";
            vector<int> _ = vector(type.wid.size(), int());
            dfs(e, _, 0);
        }
    }

    IR from_stmt(Node* o) 
    {
        IR rt;
        if(o->type == "Block") { for(auto e : o->child) rt.merge(from_stmt(e)); }
        elif(o->type == "Return")
        {
            if(!o->child.size()) rt.merge(_IR(_return));
            else
            {
                string _ = get_tmp();
                rt._with(from_exp(o->child[0], _), _IR(_return, _));
            }
        }
        elif(o->type == "While")
        {
            string l1 = get_label(), l2 = get_label(), l3 = get_label();
            rt._with(_IR(label, l1), from_condition(o->child[0], l2, l3),
            _IR(label, l2), from_stmt(o->child[1]), _IR(_goto, l1), _IR(label, l3));
        }
        elif(o->type == "If")
        {
            string l1 = get_label(), l2 = get_label();
            rt._with(from_condition(o->child[0], l1, l2),
                     _IR(label, l1), from_stmt(o->child[1]), _IR(label, l2));
        }
        elif(o->type == "IfElse")
        {
            string l1 = get_label(), l2 = get_label(), l3 = get_label();
            rt._with(from_condition(o->child[0], l1, l2), _IR(label, l1), 
                from_stmt(o->child[1]), _IR(_goto, l3), 
                _IR(label, l2), from_stmt(o->child[2]), _IR(label, l3));
        }
        elif(o->type == "Exp") { if(o->child.size()) rt.merge(from_exp(o->child[0], "")); }
        elif(o->type == "Assign") rt.merge(from_assign(o));
        elif(o->type == "Decl") rt.merge(from_decl(o, 1));
        else { DEBUG("generate ir error"); return rt; }
        return rt;
    }

    IR from_condition(Node* o, string l1, string l2)
    {
        IR rt;
        if(o->type == "AddExp")
        {
            string tmp = get_tmp();
            rt._with(from_exp(o, tmp), _IR(ifgt, tmp, "!=", "zero", l1), _IR(_goto, l2));
        }
        elif(o->child.size() == 1) // ((((())))
        {
            rt._with(from_condition(o->child[0], l1, l2));
        }
        elif(o->type == "LOrExp")
        {
            string l = get_label();
            rt._with(from_condition(o->child[0], l1, l), _IR(label, l), from_condition(o->child[2], l1, l2));
        }
        elif(o->type == "LAndExp")
        {
            string l = get_label();
            rt._with(from_condition(o->child[0], l, l2), _IR(label, l), from_condition(o->child[2], l1, l2));
        }
        elif(o->type == "EqExp" || o->type == "RelExp")
        {
            string tmp1 = get_tmp(), tmp2 = get_tmp();
            rt._with(from_exp(o->child[0], tmp1), from_exp(o->child[2], tmp2), 
            _IR(ifgt, tmp1, o->child[1]->type, tmp2, l1), _IR(_goto, l2));
        }
        else { DEBUG("generate ir error"); return rt; }
        return rt;
    }

    IR from_exp(Node* o, string tmp)
    {
        IR rt;
        if(o->type == "FuncCall")
        {
            for(auto arg : o->child[1]->child)
            {
                string t = get_tmp();
                rt._with(from_exp(arg, t), _IR(arg, t));
            }
            if(tmp != "") rt.merge(_IR(assign_call, tmp, o->child[0]->text));
            else rt.merge(_IR(call, o->child[0]->text));
        }
        elif(o->type == "LVal")
        {
            Node* id = o->child[0];
            Type type = get_type[abs(id->val)];
            // cerr << "FIND " << " " << id->text << " " << id->val << " " << tmp << "\n";
            if(type.wid.size() == 0)
            {
                // cerr << "type1 \n";
                if(tmp != "")
                {
                    if(id->val > 0)
                        rt.merge(_IR(assign, tmp, get_name(id)));
                    else
                    {
                        string t = get_tmp();
                        rt._with(_IR(assign_addr, t, get_name(id)), _IR(assign_load, tmp, t));
                    }
                }
            } else
            {
                // cerr << "type2 \n";
                string t = get_tmp();
                // cerr << t << " " << get_name(id) << "\n";
                if(id->val < 0) rt.merge(_IR(assign_addr, t, get_name(id)));
                else rt.merge(_IR(assign, t, get_name(id)));
                int widcnt = 0;
                if(o->child.size() > 1)
                {
                    Node* wid = o->child[1];
                    widcnt += wid->child.size();
                    for(int i = 0; i < wid->child.size(); ++i)
                    {
                        int sz = accumulate(type.wid.begin()+i+1, type.wid.end(), 1, multiplies<int>());
                        string tt = get_tmp(), t2 = get_tmp();
                        rt._with(from_exp(wid->child[i], tt), _IR(assign_const, t2, sz*4),
                                _IR(assign_binary, tt, tt, "*", t2), _IR(assign_binary, t, t, "+", tt));
                    }
                }
                if(tmp != "")
                {
                    if(widcnt == type.wid.size()) rt.merge(_IR(assign_load, tmp, t));
                    else rt.merge(_IR(assign, tmp, t));
                }
            }
        }
        elif(o->child.size() == 1) // ((()))
        {
            // cerr << "TRY : " << o->child[0]->type << "\n";
            return from_exp(o->child[0], tmp);
        }
        elif(o->type == "INTCONST")
        {
            if(tmp != "") rt.merge(_IR(assign_const, tmp, o->val));
        }
        elif (o->type == "AddExp" || o->type == "MulExp" || o->type == "RelExp" 
        || o->type == "EqExp" || o->type == "LAndExp" || o->type == "LOrExp")
        {
            string tmp1 = get_tmp(), tmp2 = get_tmp();
            rt._with(from_exp(o->child[0], tmp1), from_exp(o->child[2], tmp2));
            if(tmp != "") rt.merge(_IR(assign_binary, tmp, tmp1, o->child[1]->type, tmp2));
        }
        elif(o->type == "UnaryExp")
        {
            string op = o->child[0]->type;
            // cerr << "I FIND THE UNARY EXP! : " << op << "\n";
            if(op == "ADD" || op == "SUB")
            {
                string t = get_tmp();
                rt.merge(from_exp(o->child[1], t));
                if(tmp != "") rt.merge(_IR(assign_unary, tmp, op, t));
            } else
            {
                string t = get_tmp();
                rt.merge(from_exp(o->child[1], t));
                if(tmp != "") 
                {
                    string tt = get_tmp(), l = get_label();
                    rt._with(_IR(assign_const, tt, 0), _IR(assign_const, tmp, 0),
                    _IR(ifgt, t, "!=", tt, l), _IR(assign_const, tmp, 1), _IR(label, l));
                }
            }
        }
        else { DEBUG("generate ir error. The type is " + o->type); return rt; }
        return rt;
    }

    IR from_assign(Node *o)
    {
        IR rt;
        Node* lv = o->child[0];
        if(lv->child.size() == 1)
        {
            if(lv->child[0]->val > 0)
                rt.merge(from_exp(o->child[1], get_name(lv->child[0])));
            else
            {
                string t1 = get_name(lv->child[0]), t2 = get_tmp(), t3 = get_tmp();
                rt._with(from_exp(o->child[1], t2), _IR(assign_addr, t3, t1), _IR(assign_store, t3, t2));
            }
        }
        else
        {
            Node *id = lv->child[0], *wid = lv->child[1];
            string t = get_tmp(), name = get_name(id);
            if(id->val < 0) rt.merge(_IR(assign_addr, t, name));
            else rt.merge(_IR(assign, t, name));
            Type type = get_type[abs(id->val)];
            for(int i = 0; i < wid->child.size(); ++i)
            {
                int sz = accumulate(type.wid.begin()+i+1, type.wid.end(), 1, multiplies<int>());
                string t1 = get_tmp(), tt = get_tmp();
                rt._with(from_exp(wid->child[i], t1), _IR(assign_const, tt, (sz*4)), _IR(assign_binary, t1, t1, "*", tt), _IR(assign_binary, t, t, "+", t1));
            }
            string t1 = get_tmp();
            rt.merge(from_exp(o->child[1], t1));
            rt.merge(_IR(assign_store, t, t1));
        }
        return rt;
    }
};

#endif
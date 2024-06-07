#ifndef ASM_HPP
#define ASM_HPP

#include <bits/stdc++.h>
#include "ir.hpp"
using namespace std;

class _ASM
{
public:
    string type;
    virtual ~_ASM() = default;
    virtual void print(ostream& out) = 0;
};

#define REG(x) (string)("x"s+to_string(x))
std::map<string, int> Reg = {
    {"ra"s, 1}, {"sp"s, 2}, {"gp"s, 3}, {"tp"s, 4}, {"t0"s, 5}, {"t1"s, 6}, {"t2"s, 7},
    {"s0"s, 8}, {"fp"s, 8}, {"s1"s, 9}, {"a0"s, 10}, {"a1"s, 11}, {"a2"s, 12}, {"a3"s, 13}, {"a4"s, 14},
    {"a5"s, 15}, {"a6"s, 16}, {"a7"s, 17}, {"s2"s, 18}, {"s3"s, 19}, {"s4"s, 20}, {"s5"s, 21}, {"s6"s, 22},
    {"s7"s, 23}, {"s8"s, 24}, {"s9"s, 25}, {"s10"s, 26}, {"s11"s, 27}, {"t3"s, 28}, {"t4"s, 29}, {"t5"s, 30}, {"t6"s, 31},
};

class ASM_binop : public _ASM
{
    string upd(string x)
    {
        if(x=="+"||x=="add"||x=="ADD") return "add";
        if(x=="-"||x=="sub"||x=="SUB") return "sub";
        if(x=="*"||x=="mul"||x=="MUL") return "mul";
        if(x=="/"||x=="div"||x=="DIV") return "div";
        if(x=="%"||x=="mod"||x=="MOD") return "rem";
        return "##ERROR##";
    }
public:
    string lv, rv1, rv2, op;
    ASM_binop (string _op, int lv, int rv1, int rv2) : lv(REG(lv)), rv1(REG(rv1)), rv2(REG(rv2))
    { 
        _ASM::type = "binop"s;
        op = upd(_op);
    }
    void print(ostream& out) { out << op << " " << lv << ", " << rv1 << ", " << rv2 << "\n"; }
};

class ASM_binop_imm : public _ASM
{
public:
    string lv, rv1, imm, op;
    ASM_binop_imm(string op, int lv, int rv1, int imm) : lv(REG(lv)), rv1(REG(rv1)), imm(to_string(imm)) { _ASM::type = "binop_imm"s; }
    void print(ostream& out) { out << "addi " << lv << ", " << rv1 << ", " << imm << "\n"; }
};

class ASM_mv : public _ASM
{
public:
    string lv, rv;
    ASM_mv(int lv, int rv) : lv(REG(lv)), rv(REG(rv)) { _ASM::type = "mv"s; }
    void print(ostream& out) { out << "mv " << lv << ", " << rv << "\n"; }
};

class ASM_li : public _ASM
{
public:
    string lv, imm;
    ASM_li(int lv, int imm) : lv(REG(lv)), imm(to_string(imm)) { _ASM::type = "li"s; }
    void print(ostream& out) { out << "li " << lv << ", " << imm << "\n"; }
};

class ASM_lw : public _ASM 
{
public:
    string lv, rv, offset;
    ASM_lw(int lv, int rv, int offset) : lv(REG(lv)), rv(REG(rv)), offset(to_string(offset)) { _ASM::type = "lw"s; }
    void print(ostream& out) { out << "lw " << lv << ", " << offset << "(" << rv << ")" << "\n"; }
};

class ASM_sw : public _ASM
{
public:
    string lv, rv, offset;
    ASM_sw(int rv, int lv, int offset) : lv(REG(lv)), rv(REG(rv)), offset(to_string(offset)) { _ASM::type = "sw"s; }
    void print(ostream& out) { out << "sw " << rv << ", " << offset << "(" << lv << ")" << "\n"; }
};

class ASM_label : public _ASM
{
public:
    string lab;
    ASM_label(string lab) : lab(lab) { _ASM::type = "label"s; }
    void print(ostream& out) { out << lab << ": " << "\n"; }
};

class ASM_j : public _ASM
{
public:
    string lab;
    ASM_j(string lab) : lab(lab) { _ASM::type = "j"s; }
    void print(ostream& out) { out << "j " << lab << "\n"; }
};

class ASM_jal : public _ASM 
{
public:
    string lab;
    ASM_jal(string lab) : lab(lab) { _ASM::type = "jal"s; }
    void print(ostream& out) { out << "jal " << lab << "\n"; }
};

class ASM_ret : public _ASM
{
public:
    ASM_ret() { _ASM::type = "ret"s; }
    void print(ostream& out) { out << "ret\n"; }
};

class ASM_branch : public _ASM 
{
    string upd(string r) 
    {
        if(r == "EQ"s || r == "=="s) return "beq"s; if(r == "NEQ"s || r == "!="s) return "bne"s;
        if(r == "LT"s || r == "<"s ) return "blt"s; if(r == "LE"s || r == "<="s) return "ble"s;
        if(r == "GT"s || r == ">"s) return "bgt"s; if(r == "GE"s || r == ">="s) return "bge"s;
        return "##ERROR##"s;
    }
public:
   string op, rv1, rv2, lab;
   ASM_branch(string op, int rv1, int rv2, string lab) : op(op), rv1(REG(rv1)), rv2(REG(rv2)), lab(lab) { _ASM::type = "branch"s; }
   void print(ostream& out) { out << upd(op) << " " << rv1 << ", " << rv2 << ", " << lab << "\n"; } 
};

class ASM_ecall : public _ASM 
{
public:
    ASM_ecall() { _ASM::type = "ecall"s; }
    void print(ostream& out) { out << "ecall\n"; }
};

class ASM_neg : public _ASM 
{
public:
    string lv, rv;
    ASM_neg(int lv, int rv) : lv(REG(lv)), rv(REG(rv)) { _ASM::type = "neg"s; }
    void print(ostream& out) {out << "neg " << lv << ", " << rv << "\n"; }
};

class ASM_la : public _ASM 
{
public:
    string lv, lab;
    ASM_la(int lv, string lab) : lv(REG(lv)), lab(lab) { _ASM::type = "la"s; }
    void print(ostream& out) { out << "la " << lv << ", " << lab << "\n"; }
};

class ASM_word : public _ASM 
{
public:
    int val;
    ASM_word(int val) : val(val) { _ASM::type = "word"s; }
    void print(ostream& out) { out << ".word " << val << "\n"; }
};

class ASM_psuedo : public _ASM
{
public:
    string _;
    ASM_psuedo(string _) : _(_) { _ASM::type = "psuedo"s; }
    void print(ostream& out) { out << _ << "\n"; }
};
#define A(type, ...) (new ASM_##type(__VA_ARGS__))

#define Info(type, x) (dynamic_cast<info_##type*>((x).info.get()))

class ASM
{
    class IRs : public IR
    {
    public:
        IRs () {}
        IRs (const IR &ir) : IR(ir) {}
        set<string> var, par;
        string fname;
        map<string, int> pos;
        void get_func_info()
        {
            for (auto e : child)
            {
                if(e.type == "PARAM")
                    par.insert(Info(param, e)->name);
                if(e.type == "FUNCTION")
                    fname = Info(function, e)->name;
            }
        }
        void place_var()
        {
            for (auto &e : child) if (e.type == "PARAM")
            {
                string lv = Info(param, e)->name;
                if(!pos.count(lv)) pos[lv] = (par.size()-pos.size())*4;
            }
            pos["ra"]=0; pos["fp"]=-4;
            for (auto &e : child)
            {
                if(e.type == "DEC")
                {
                    string lv = Info(dec, e)->name;
                    if (!pos.count(lv)) pos[lv] = (par.size()-pos.size())*4;
                }
                if(e.type.substr(0, 6) == "ASSIGN")
                {
                    string lv = "";
                    if (e.type == "ASSIGN") lv = Info(assign, e)->lv;
                    if (e.type == "ASSIGN const") lv = Info(assign_const, e)->lv;
                    if (e.type == "ASSIGN binary") lv = Info(assign_binary, e)->lv;
                    if (e.type == "ASSIGN call") lv = Info(assign_call, e)->lv;
                    if (e.type == "ASSIGN load") lv = Info(assign_load, e)->lv;
                    if (e.type == "ASSIGN store") lv = Info(assign_store, e)->lv;
                    if (e.type == "ASSIGN addr") lv = Info(assign_addr, e)->lv;
                    if (lv != "" && !pos.count(lv)) pos[lv] = (par.size()-pos.size())*4;
                }
            }
        }
    };
    class ASMs 
    {
    public:
        vector<unique_ptr<_ASM>> child;
        string fname;
        void print(ostream& out)
        {
            for(auto &e : child) e -> print(out);
        }

        template<typename T>
        void push_back(T o) { child.push_back(unique_ptr<_ASM>(o)); }

        template<typename... Args> void PUSH(Args... args)
        {
            (child.push_back(unique_ptr<_ASM>(args)), ...);
        }
    };

    template<typename... Args> ASMs ASMS(Args... args)
    {
        ASMs tmp;
        (tmp.child.push_back(unique_ptr<_ASM>(args)), ...);
        return tmp;
    }
public:
    vector<IRs> irs;
    vector<ASMs> asms;
    ASM(const IR& ir)
    {
        // ****** split ir code to blocks by functions ******* //
        irs.clear(); asms.clear();
        vector<IR> _;
        for (auto &e : ir.child)
        {
            if (e.type == "FUNCTION" && _.size() != 0) 
            {
                IRs tmp; tmp.child = _;
                irs.push_back(tmp); _.clear();
            } 
            _.push_back(e);
        }
        if(_.size() != 0)
        {
            IRs tmp; tmp.child = _;
            irs.push_back(tmp); _.clear();
        }
        // ****** parse ir code to asm code ******* //
        parse();
    }
    void parse()
    {
        asms.push_back(ASMS(A(psuedo, ".text"), A(j, "main")));
        for (auto &bl : irs)
        {
            ASMs tmp;
            if(bl.child[0].type == "FUNCTION") tmp.push_back(A(psuedo, ".text"));
            elif(bl.child[0].type == "GLOBAL") tmp.push_back(A(psuedo, ".data"));
            bl.get_func_info();
            bl.place_var();
            tmp.fname = bl.fname;
            for (auto &e : bl.child) parse_ir(e, tmp, bl);
            asms.push_back(std::move(tmp));
        }
    }
    void print(ostream& OUT) { for(auto &e : asms) e.print(OUT); }

    void parse_ir(IR& e, ASMs& o, IRs& bl)
    {
        string type = (e.info.get())->type;
        if (type == "ASSIGN binary"s) 
        {
            auto x = Info(assign_binary, e);
            o.PUSH(A(lw, Reg["t0"], Reg["fp"], bl.pos[x->v1]), A(lw, Reg["t1"], Reg["fp"], bl.pos[x->v2]),
                   A(binop, x->op, Reg["t2"], Reg["t0"], Reg["t1"]), A(sw, Reg["t2"], Reg["fp"], bl.pos[x->lv]));
        }
        elif (type == "ASSIGN"s)
        {
            auto x = Info(assign, e);
            o.PUSH(A(lw, Reg["t0"], Reg["fp"], bl.pos[x->rv]), A(sw, Reg["t0"], Reg["fp"], bl.pos[x->lv]));
        }
        elif (type == "ASSIGN const"s)
        {
            auto x = Info(assign_const, e);
            o.PUSH(A(li, Reg["t0"], x->rv), A(sw, Reg["t0"], Reg["fp"], bl.pos[x->lv]));
        }
        elif (type == "ASSIGN unary"s)
        {
            auto x = Info(assign_unary, e);
            if (x->op != "SUB") return ;
            o.PUSH(A(lw, Reg["t0"], Reg["fp"], bl.pos[x->rv]), A(neg, Reg["t1"], Reg["t0"]), A(sw, Reg["t1"], Reg["fp"], bl.pos[x->lv]));
        }
        elif (type == "LABEL"s)
        {
            auto x = Info(label, e);
            o.PUSH(A(label, x->name));
        }
        elif (type == "GOTO"s)
        {
            auto x = Info(_goto, e);
            o.PUSH(A(j, x->name));
        }
        elif (type == "IFGT"s)
        {
            auto x = Info(ifgt, e);
            o.PUSH(A(lw, Reg["t0"], Reg["fp"], bl.pos[x->v1]), A(lw, Reg["t1"], Reg["fp"], bl.pos[x->v2]), A(branch, x->op, Reg["t0"], Reg["t1"], x->name));
        }
        elif (type == "RETURN"s)
        {
            auto x = Info(_return, e);
            if (x->v != ""s) 
                o.PUSH(A(lw, Reg["a0"], Reg["fp"], bl.pos[x->v]));
            o.PUSH(A(lw, Reg["ra"], Reg["fp"], 0), A(lw, Reg["fp"], Reg["fp"], -4), A(binop_imm, "ADD", Reg["sp"], Reg["sp"], 4*(bl.pos.size()+2)));
            if (bl.fname != "main") o.PUSH(A(ret));
            else o.PUSH(A(li, Reg["a0"], 17), A(li, Reg["a1"], 0), A(ecall));
        }
        elif (type == "ARG"s)
        {
            auto x = Info(arg, e);
            o.PUSH(A(binop_imm, "ADD", Reg["sp"], Reg["sp"], -4), A(lw, Reg["t0"], Reg["fp"], bl.pos[x->name]), A(sw, Reg["t0"], Reg["sp"], 0));
        }
        elif (type == "CALL"s)
        {
            auto x = Info(call, e);
            if (x->name == "read")
                o.PUSH(A(li, Reg["a0"], 6), A(ecall));
            elif (x->name == "write")
                o.PUSH(A(li, Reg["a0"], 1), A(lw, Reg["a1"], Reg["sp"], 0), A(ecall));
            else o.PUSH(A(jal, x->name));
        }
        elif (type == "ASSIGN call"s)
        {
            auto x = Info(assign_call, e);
            if (x->name == "read")
                o.PUSH(A(li, Reg["a0"], 6), A(ecall), A(sw, Reg["a0"], Reg["fp"], bl.pos[x->lv]));
            else 
                o.PUSH(A(jal, x->name), A(sw, Reg["a0"], Reg["fp"], bl.pos[x->lv]));
        }
        elif (type == "FUNCTION"s)
        {
            auto x = Info(function, e); int _ = bl.pos.size()-bl.par.size();
            o.PUSH(A(label, x->name), A(binop_imm, "ADD", Reg["sp"], Reg["sp"], -4*(_+2)),
                   A(sw, Reg["fp"], Reg["sp"], 4*_), A(sw, Reg["ra"], Reg["sp"], 4*(_+1)), A(binop_imm, "ADD", Reg["fp"], Reg["sp"], 4*(_+1)));
        }
        elif (type == "ASSIGN load"s)
        {
            auto x = Info(assign_load, e);
            o.PUSH(A(lw, Reg["t0"], Reg["fp"], bl.pos[x->rv]), A(lw, Reg["t1"], Reg["t0"], 0), A(sw, Reg["t1"], Reg["fp"], bl.pos[x->lv]));
        }
        elif (type == "ASSIGN store"s)
        {
            auto x = Info(assign_store, e);
            o.PUSH(A(lw, Reg["t0"], Reg["fp"], bl.pos[x->rv]), A(lw, Reg["t1"], Reg["fp"], bl.pos[x->lv]), A(sw, Reg["t0"], Reg["t1"], 0));
        }
        elif (type == "DEC"s)
        {
            auto x = Info(dec, e);
            o.PUSH(A(binop_imm, "ADD", Reg["sp"], Reg["sp"], -x->siz), A(mv, Reg["t0"], Reg["sp"]), A(sw, Reg["t0"], Reg["fp"], bl.pos[x->name]));
        }
        elif (type == "GLOBAL"s)
        {
            auto x = Info(global, e);
            o.PUSH(A(label, x->name));
        }
        elif (type == "ASSIGN addr"s)
        {
            auto x = Info(assign_addr, e);
            o.PUSH(A(la, Reg["t0"], x->rv), A(sw, Reg["t0"], Reg["fp"], bl.pos[x->lv]));
        }
        elif (type == "WORD"s)
        {
            auto x = Info(word, e);
            o.PUSH(A(word, x->val));
        }
    }
};

#endif
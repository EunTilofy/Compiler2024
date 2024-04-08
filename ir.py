from __future__ import annotations
from lark import Lark, ast_utils, Transformer, Token
from dataclasses import dataclass
from enum import Enum
import random

import sys
import argparse

DEBUG = False

# -------------------------------- IRNode --------------------------------#


class Op(Enum):
    def __str__(self) -> str:
        return self.value


class BinOp(Op):
    Add = "+"
    Sub = "-"
    Mul = "*"
    Div = "/"
    Mod = "%"


class RelOp(Op):
    Gt = ">"
    Ge = ">="
    Lt = "<"
    Le = "<="
    Eq = "=="
    Ne = "!="


class UnOp(Op):
    Neg = "-"
    Pos = "+"


@dataclass
class IRNode(ast_utils.Ast):
    """
    IRNode is the base class for all IR nodes.
    """

    def __str__(self) -> str:
        raise NotImplementedError("IRNode.__str__() is not implemented.")


@dataclass
class Binary(IRNode):
    """
    BinaryOp is the class for all binary operations.
    """

    dst: Token
    left: Token
    op: BinOp
    right: Token

    def __str__(self) -> str:
        return f"{self.dst} := {self.left} {self.op} {self.right}"


@dataclass
class Binaryi(IRNode):
    """
    BinaryOp is the class for all binary operations.
    """

    dst: Token
    left: Token
    op: BinOp
    right: int

    def __init__(self, dst, left, op, right):
        self.dst = dst
        self.left = left
        self.op = op
        self.right = int(right.value)

    def __str__(self) -> str:
        return f"{self.dst} := {self.left} {self.op} #{self.right}"


@dataclass
class Unary(IRNode):
    """
    UnaryOp is the class for all unary operations.
    """

    dst: Token
    op: UnOp
    right: Token

    def __str__(self) -> str:
        return f"{self.dst} := {self.op} {self.right}"


@dataclass
class Store(IRNode):
    """
    Store is a special IRNode for storing a value to a pointer.
    *x = y
    """

    left: Token
    right: Token

    def __str__(self) -> str:
        return f"*{self.left} := {self.right}"


@dataclass
class Deref(IRNode):
    """
    x = *y
    """

    left: Token
    right: Token

    def __str__(self) -> str:
        return f"{self.left} := *{self.right}"


@dataclass
class Li(IRNode):
    """
    LoadImm is a special IRNode for loading an immediate value.
    """

    label: Token
    value: int

    def __init__(self, label, token):
        self.label = label
        self.value = int(token.value)

    def __str__(self) -> str:
        return f"{self.label} = #{self.value}"


@dataclass
class Function(IRNode):
    """ Defining a function. """

    name: Token

    def __str__(self) -> str:
        return f"Function {self.name}"


@dataclass
class Label(IRNode):
    """ Defining a label. """

    label: Token

    def __str__(self) -> str:
        return f"Label {self.label}"


@dataclass
class Goto(IRNode):
    """ Jumping to a label. """

    label: Token

    def __str__(self) -> str:
        return f"Goto {self.label}"


@dataclass
class Param(IRNode):
    """ Passing a parameter. """

    name: Token

    def __str__(self) -> str:
        return f"Param {self.name}"


@dataclass
class Assign(IRNode):
    """ Assigning a variable. """

    dst: Token
    src: Token

    def __str__(self) -> str:
        return f"{self.dst} := {self.src}"


@dataclass
class If(IRNode):
    """ If statement. """

    left: Token
    op: RelOp
    right: Token
    label: Token

    def __str__(self) -> str:
        return f"If {self.left} {self.op} {self.right} Goto {self.label}"


@dataclass
class Return(IRNode):
    """ Returning a value. """

    name: Token | None

    def __init__(self, *args):
        if len(args) == 1:
            self.name = args[0]
        else:
            self.name = None

    def __str__(self) -> str:
        return f"Return {self.name}"


@dataclass
class Arg(IRNode):
    """ Passing an argument. """

    name: Token

    def __str__(self) -> str:
        return f"Arg {self.name}"


@dataclass
class Call(IRNode):
    """ Calling a function. """

    left: Token | None
    right: Token

    def __init__(self, *args):
        if len(args) == 2:
            self.left, self.right = args
        elif len(args) == 1:  # do not have return value
            self.left = None
            self.right = args[0]

    def __str__(self) -> str:
        if self.left:
            return f"{self.left} := Call {self.right}"
        else:
            return f"{self.left} := Call {self.right}"


@dataclass
class Dec(IRNode):
    """ Passing an argument. """

    name: Token
    size: int

    def __init__(self, name, token):
        self.name = name
        self.size = int(token.value)

    def __str__(self) -> str:
        return f"Dec {self.name} #{self.size}"

@dataclass
class La(IRNode):
    """ Load address of a label """

    dst: Token
    label: Token

    def __str__(self) -> str:
        return f"{self.dst} := &{self.label}"

@dataclass
class Global(IRNode):
    """ Define a global variable """

    name: Token

    def __init__(self, name):
        self.name = name

    def __str__(self) -> str:
        return f"Global {self.name}:"
    
@dataclass
class Fillw(IRNode):
    """ Fill word to current address """

    value: int

    def __init__(self, token):
        self.value = int(token.value)

    def __str__(self) -> str:
        return f".word #{self.value}"

class ToIR(Transformer):
    def start(self, args): return args
    def mul(self, _): return BinOp.Mul
    def div(self, _): return BinOp.Div
    def mod(self, _): return BinOp.Mod
    def add(self, _): return BinOp.Add
    def sub(self, _): return BinOp.Sub
    def gt(self, _): return RelOp.Gt
    def ge(self, _): return RelOp.Ge
    def lt(self, _): return RelOp.Lt
    def le(self, _): return RelOp.Le
    def eq(self, _): return RelOp.Eq
    def ne(self, _): return RelOp.Ne
    def neg(self, _): return UnOp.Neg
    def pos(self, _): return UnOp.Pos

# -------------------------------- Parser --------------------------------#


parser = Lark("""
start: instruction*

?instruction: "LABEL" NAME ":" -> label
    | "GOTO" NAME -> goto
    | "IF" NAME relop NAME "GOTO" NAME -> if
    | NAME "=" NAME -> assign
    | NAME "=" unop NAME -> unary
    | "*" NAME "=" NAME -> store
    | NAME "=" "*" NAME -> deref
    | NAME "=" NAME binop NAME -> binary
    | NAME "=" NAME binop "#" SIGNED_INT -> binaryi
    | NAME "=" "#" SIGNED_INT -> li
    | "PARAM" NAME -> param
    | "ARG" NAME -> arg
    | "RETURN" NAME -> return
    | "RETURN" -> return
    | NAME "=" "CALL" NAME -> call
    | "CALL" NAME -> call
    | "FUNCTION" NAME ":" -> function
    | "DEC" NAME "#" SIGNED_INT -> dec
    | NAME "=" "&" NAME -> la
    | "GLOBAL" NAME ":" -> global
    | ".WORD" "#" SIGNED_INT -> fillw

?relop : "<" -> lt
    | ">" -> gt
    | "<=" -> le
    | ">=" -> ge
    | "==" -> eq
    | "!=" -> ne
    
?binop: "+" -> add
    | "-" -> sub
    | "*" -> mul
    | "/" -> div
    | "%" -> mod

?unop : "-" -> neg
    | "+" -> pos
    
%import python.NAME
%import common.SIGNED_INT
%import common.WS
%import common.CPP_COMMENT
%import common.C_COMMENT

%ignore WS
%ignore CPP_COMMENT
%ignore C_COMMENT
""", parser = "earley")


this_module = sys.modules[__name__]


transformer = ast_utils.create_transformer(this_module, ToIR())


def parse(text):
    tree = parser.parse(text)
    return transformer.transform(tree)


def parse_file(filename):
    with open(filename) as f:
        return parse(f.read())

# -------------------------------- Interpreter --------------------------------#


class Environment:
    """ Environment contains all variables mapping and arrays. """

    def __init__(self) -> None:
        self.env = {}
        self.arrays: set[Array] = set()
        self.labels = {}

    def show(self):
        for k, v in self.env.items():
            print(f"{k}: {v}")

    def __getitem__(self, key: str):
        if key in self.env.keys():
            return self.env[key]
        else:
            if key in global_env.env.keys():
                return global_env[key]
            else:
                raise ValueError(f"Variable {key} is not defined.")

    def __setitem__(self, key: str, value: int | FunctionFrame) -> None:
        self.env[key] = value

    def load(self, address: Token) -> int:
        """ Load value from address
        always find in global env
        """

        value = self[address]
        for array in global_env.arrays:
            if array.contain(value):
                return array.get(value)
        raise ValueError(f"address {address} not found in load")

    def store(self, address: Token, src: Token) -> None:
        """ Store value to address"""
        value = self[address]
        for array in global_env.arrays:
            if array.contain(value):
                array.set(value, self[src])
                return
        raise ValueError(f"address {address} not found in store")


class Array:
    HEAD = 0x1000

    def __init__(self, start_address: int, size: int) -> None:
        self.start_address = start_address
        self.size = size
        self.values = [random.randint(1, 0xffff) for _ in range(size)]

    @staticmethod
    def new(size: int) -> int:
        start_address = Array.HEAD
        array = Array(start_address, size//4) # 4 bytes per int
        global_env.arrays.add(array)
        Array.HEAD += size
        return start_address

    def contain(self, address: int) -> bool:
        return address >= self.start_address and address < self.start_address + self.size * 4

    def get(self, address: int) -> int:
        return self.values[(address - self.start_address) // 4]

    def set(self, address: int, value: int) -> None:
        self.values[(address - self.start_address) // 4] = value


global_env = Environment()

# op2func maps an operator to a function
op2func = {
    # binary op
    BinOp.Add: lambda x, y: x + y,
    BinOp.Sub: lambda x, y: x - y,
    BinOp.Mul: lambda x, y: x * y,
    BinOp.Div: lambda x, y: int(x / y),
    BinOp.Mod: lambda x, y: x % y,
    # relation op
    RelOp.Gt: lambda x, y: x > y,
    RelOp.Lt: lambda x, y: x < y,
    RelOp.Ge: lambda x, y: x >= y,
    RelOp.Le: lambda x, y: x <= y,
    RelOp.Eq: lambda x, y: x == y,
    RelOp.Ne: lambda x, y: x != y,
    # unary op
    UnOp.Neg: lambda x: -x,
    UnOp.Pos: lambda x: x,
}


class FunctionFrame:
    def __init__(self, name: str) -> None:
        self.name = name
        self.labels = {}
        self.codes = []
        self.env = Environment()

    def new(self) -> FunctionFrame:
        new_frame = FunctionFrame(self.name)
        new_frame.codes = self.codes
        new_frame.labels = self.labels
        return new_frame

    def run(self, params: list[int] = []):
        """ Run the function with given params. """
        # current pc
        pc = 0
        # current stack
        args = []
        env = self.env
        while pc < len(self.codes):
            ir = self.codes[pc]
            pc += 1  # always increase pc
            if DEBUG:
                print(ir)
            # run the code and get the next pc
            match ir:
                case Binary(dst, left, op, right):
                    if op in op2func.keys():
                        env[dst] = op2func[op](env[left], env[right])
                    else:
                        raise NotImplementedError(
                            f"{op} is not implemented.")
                case Binaryi(dst, left, op, right):
                    if op in op2func.keys():
                        env[dst] = op2func[op](env[left], right)
                    else:
                        raise NotImplementedError(
                            f"{op} is not implemented.")
                case Unary(dst, op, right):
                    if op in op2func.keys():
                        env[dst] = op2func[op](env[right])
                    else:
                        raise NotImplementedError(
                            f"{op} is not implemented.")
                case Li(label, value):
                    env[label] = value
                # function definition and label is not code
                case Function(name) | Label(name):
                    global_env.labels[name] = pc
                case Goto(label):
                    if label not in self.labels:
                        raise ValueError(
                            f"Label {label} in function {self.name} is not defined.")
                    pc = self.labels[label]
                case Assign(dst, src):
                    env[dst] = env[src]
                case Return(src):
                    if src is None:  # void return
                        return None
                    return env[src]
                case Arg(src):
                    args.append(env[src])
                case Param(dst):  # get the param from the stack
                    if len(params) == 0:
                        raise ValueError(
                            f"Function {self.name} needs more parameters.")
                    env[dst] = params.pop(0)
                case Call(dst, name):
                    if name == 'read':
                        res = int(input())
                        if dst is not None:
                            env[dst] = res
                    elif name == 'write':
                        print(args[0])
                        args = []  # reset args
                    else:
                        res = env[name].new().run(args)
                        if dst is not None:
                            env[dst] = res
                        args = []  # reset args
                case If(left, op, right, label):
                    if op in op2func.keys():
                        if op2func[op](env[left], env[right]) == 1:
                            pc = self.labels[label]
                    else:
                        raise NotImplementedError(
                            f"{op} in relop is not implemented.")
                case Dec(dst, size):
                    env[dst] = Array.new(size)
                case Store(dst, src):  # * x = y
                    env.store(dst, src)
                case Deref(dst, src):  # x = * y
                    value = env.load(src)
                    env[dst] = value
                case La(dst, label):
                    if label not in global_env.labels:
                        raise ValueError(
                            f"Label {label} in function {self.name} is not defined.")
                    env[dst] = global_env.labels[label]
                case _:
                    raise NotImplementedError(f"{ir} is not implemented.")
        assert False, f"No return statement in function {self.name}."

    def add_code(self, code) -> None:
        self.codes.append(code)

    def add_label(self, label) -> None:
        self.labels[label] = len(self.codes)

    def __str__(self) -> str:
        codes = [f"{self.codes[0]}:"]
        for code in self.codes[1:]:
            codes.append(f"    {code}")
        return "\n".join(codes)


def build_function(irs: list[IRNode]) -> list[FunctionFrame]:
    frames = []
    global_var: dict[str, list[int]] = {}
    current_var = None
    if len(irs) == 0 or not (isinstance(irs[0], Function) or isinstance(irs[0], Global)):
        raise SyntaxError("IR should start with a FUNCTION or GLOBAL.")
    for ir in irs:
        if isinstance(ir, Function):
            frame = FunctionFrame(ir.name)
            frames.append(frame)
            global_env[ir.name] = frame
            frames[-1].add_code(ir)
            current_var = None
        elif isinstance(ir, Label):
            frames[-1].add_label(ir.label)
            frames[-1].add_code(ir)
        elif isinstance(ir, Global):
            if frames:
                raise SyntaxError("Global variable should be defined before function.")
            global_var[ir.name] = []
            current_var = ir.name
        elif isinstance(ir, Fillw):
            if current_var is None:
                raise SyntaxError("No global variable to fill")
            global_var[current_var].append(ir.value)
        else:
            frames[-1].add_code(ir)
    for name, values in global_var.items():
        address = Array.new(len(values) * 4)
        for array in global_env.arrays:
            if array.contain(address):
                for i, value in enumerate(values):
                    array.set(address + i * 4, value)
                break
        global_env.labels[name] = address
    return frames


def run(irs: list[IRNode]):
    """
    Runs the given IRNodes in the given environment.
    """
    all_functions = build_function(irs)
    if DEBUG:
        [print(frame) for frame in all_functions]
        print("\033[31m")
        print("If IRs are not correctly parsed, please contact to TA asap.")
        print("\033[0m")
    if "main" not in global_env.env.keys():
        raise SyntaxError("No main function.")
    main = global_env["main"]
    return_value = main.run()
    return return_value


if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser(
        description="Interpret file generated by your compiler.")
    arg_parser.add_argument("file", type=str, help="The IR file to interpret.")
    arg_parser.add_argument("-d", "--debug", action="store_true",
                            help="Whether to print debug info.")
    arg_parser.add_argument("-t", "--test", action="store_true", help="Whether to turn on test mode.")
    args = arg_parser.parse_args()
    if args.debug:
        print("Debug mode on.")
        DEBUG = True
    irs = parse_file(args.file)
    return_value = run(irs)
    # 0 green, else red
    if not args.test:
        return_value = f"\033[1;32m{return_value}\033[0m" if return_value == 0 else f"\033[1;31m{return_value}\033[0m"
        print('exit with code', return_value)

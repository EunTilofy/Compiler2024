CXX = g++
FLEX = flex
BISON = bison
CXXFLAGS = -std=c++17 -g -Wall
SRC_DIR = src

CFILES = $(shell find $(SRC_DIR) -name "*.c")
OBJS = $(CFILES:.c=.o)
CPPFILES = $(shell find $(SRC_DIR) -name "*.cpp")
OBJS += $(CPPFILES:.cpp=.o)
CCFILES = $(shell find $(SRC_DIR) -name "*.cc")
OBJS += $(CCFILES:.cc=.o)
LFILE = $(shell find $(SRC_DIR) -name "*.l")
YFILE = $(shell find $(SRC_DIR) -name "*.y")
LCCFILE = $(LFILE:.l=.yy.cc)
YCCFILE = $(YFILE:.y=.tab.cc)
YHEADER = $(YCCFILE:.cc=.hh)
LOBJ = $(LCCFILE:.cc=.o)
YOBJ = $(YCCFILE:.cc=.o)

compiler: $(LOBJ) $(YOBJ) $(OBJS)
	$(CXX) -o $@ $^

$(YOBJ): $(YCCFILE)
	$(CXX) $(CXXFLAGS) -c $^ -o $@

$(YCCFILE) $(YHEADER): $(YFILE)
	$(BISON) -d -o $(YCCFILE) $^

$(LOBJ): $(LCCFILE)
	$(CXX) $(CXXFLAGS) -c $^ -o $@

$(LCCFILE): $(LFILE) $(YHEADER)
	$(FLEX) -o $@ $<

.PHONY: clean submit
clean:
	rm -f $(LCCFILE) $(YCCFILE) $(YHEADER)
	rm -f $(OBJS)
	rm -f compiler

submit:
	zip -r submit.zip $(SRC_DIR)

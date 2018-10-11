# Preparation: Store the directory that contains this file (it sould be named fp04b) next to the min-caml directory.
# The directory structure should like
#
# fp-+- fp04a - 
#    +- fp04b -+- Makefile (this file)
#    |         +- fib.ml
#    +- min-caml -+- PowerPC -+
#                 +- SPARC -+
#                 +- bytemark -+
#                 +- min-rt -+
#                 +- shootout -+
#                 +- ...
#                 +- libmincaml.S (a small runtime library written in assembly language)
#                 +- ...
#                 +- min-caml (the Min Caml compiler)
#                 +- min-caml.top (an OCaml interpreter that linked with Min-Caml compiler code)
#                 +- ...
#                 +- stub.c (a small interface code that bridges Min-Caml and C)
#
# At first the content of this directory are Makefile and fib.ml
#
# When you start "make", it compiles "fib.ml" and generates an executable command named "fib"
#
# If compilation is successful you can run the command with "./fib".  Simply running "fib" fails
# on Linux and macOS.


# The directory where we can find the min-caml source tree
MINCAML="../min-caml"

# The default build target is "fib"
all: fib


# The following rule states that "fib.s" should be created from "fib.ml".
# The file extension ".s" is given to assembly files.
# The generation of "fib.s" from "fib.ml" is done by the "min-caml" compiler stored in the above defined directory.
fib.s: fib.ml
	$(MINCAML)/min-caml fib

# The following rule describes how we process the assembly code (fib.s) and
# link it to the runtime system to generate an executable command (fib).
# The first line states that the executable "fib" is built from an assembly file "fib.s".
# The second line is the build rule.  "clang" is the standard C compiler on macOS.  If you
# are using Linux or Windows, you should modify it with the name of the C compiler that was
# used to build Min Caml system.
# The following are options to the C compiler:
#   -m32:    32-bits code generation
#   -O2:     Optimization level 2
#   -Wall:   Generate all the warning message.
#   $(MINCAML)/libmincaml.S: Min-Caml's standard runtime library written in assembly language.
#   $(MINCAML)/stub.c:       A small bridging interface between Min-Caml and C.
#   -lm:     We are using the standard mathematics library
#   -o fib:  The output of the resulting program.
fib: fib.s
	clang -m32 -O2 -Wall fib.s $(MINCAML)/libmincaml.S $(MINCAML)/stub.c -lm -o fib

# If you want to clean this directory as it original was, run "make clean".
clean:
	rm -f *.o fib.s fib

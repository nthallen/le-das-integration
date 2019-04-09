tmcbase = base.tmc
colbase =
cmdbase = root.cmd
genuibase = Bootstrap.genui

TGTDIR = $(PWD)/../..
IGNORE = "*.o" "*.exe" "*.stackdump" Makefile
SCRIPT = doBootstrapclt.sh
IDISTRIB = interact.sh

Bootstrapcol :
Bootstrapsrvr :
Bootstrapclt :
%%
CXXFLAGS=-g

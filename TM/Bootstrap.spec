tmcbase = base.tmc
colbase =
cmdbase = root.cmd
genuibase = Bootstrap.genui

TGTDIR = $(PWD)/../..
IGNORE = "*.o" "*.exe" "*.stackdump" Makefile
SCRIPT = doBootstrapclt.sh cyg_nc.sh
IDISTRIB = interact.sh cleanup.sh

Bootstrapcol :
Bootstrapsrvr :
Bootstrapclt :
Bootstrapdisp : display.tbl
%%
CXXFLAGS=-g

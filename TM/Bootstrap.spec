tmcbase = base.tmc
tmcbase = /usr/local/share/linkeng/flttime.tmc
colbase =
# cmdbase = root.cmd
genuibase = Bootstrap.genui

Module driver

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

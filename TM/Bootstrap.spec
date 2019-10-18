tmcbase = base.tmc
tmcbase = tmdf.tmc
tmcbase = /usr/local/share/linkeng/flttime.tmc
colbase = tmdf_col.tmc
# cmdbase = root.cmd
genuibase = Bootstrap.genui
genuibase = tmdf.genui

Module driver

TGTDIR = $(PWD)/../..
IGNORE = "*.o" "*.exe" "*.stackdump" Makefile
SCRIPT = doBootstrapclt.sh cyg_nc.sh
IDISTRIB = interact.sh cleanup.sh
DISTRIB = services

Bootstrapcol :
Bootstrapsrvr :
Bootstrapclt :
Bootstrapdisp : display.tbl
%%
CXXFLAGS=-g

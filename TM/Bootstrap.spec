tmcbase = base.tmc
tmcbase = tmdf_driver.tmc
tmcbase = /usr/local/share/linkeng/flttime.tmc
colbase = tmdf_driver_col.tmc
# cmdbase = root.cmd
genuibase = Bootstrap.genui
genuibase = tmdf_driver.genui

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

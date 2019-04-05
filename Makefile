TMCBASE=base.tmc
CXXFLAGS=-g -I/usr/local/include
all : Bootstrapcol Bootstrapsrvr Bootstrapclt

.PHONY : clean all

OBJ=*.o

Bootstrapcol : Bootstrapcol.o Bootstrapcoloui.o /usr/local/lib/libdasio.a
	$(CXX) -o Bootstrapcol -g Bootstrapcol.o Bootstrapcoloui.o -L/usr/local/lib -ldasio -lnl
OBJ += Bootstrapcol Bootstrapcol.cc Bootstrapcoloui.cc
Bootstrapcol.cc : $(TMCBASE) $(COLBASE)
	tmc -p -V Bootstrap.pcm -D tm.dac -c -s -o Bootstrapcol.cc $(TMCBASE) $(COLBASE)
Bootstrapcoloui.cc : Bootstrapcol.oui
	oui -o Bootstrapcoloui.cc Bootstrapcol.oui
Bootstrapsrvr : Bootstrapsrvr.o Bootstrapsrvroui.o /usr/local/lib/libdasio.a
	$(CXX) -o Bootstrapsrvr -g Bootstrapsrvr.o Bootstrapsrvroui.o -L/usr/local/lib -ldasio -lnl
Bootstrapsrvr.o : Bootstrapcmd.cc
	$(CXX) -c -o Bootstrapsrvr.o -DSERVER $(CXXFLAGS) Bootstrapcmd.cc
Bootstrapsrvroui.cc : Bootstrapsrvr.oui
	oui -o Bootstrapsrvroui.cc Bootstrapsrvr.oui
OBJ += Bootstrapsrvr Bootstrapsrvr.cc Bootstrapsrvroui.cc
Bootstrapcmd.cc : root.cmd
	cmdgen -o Bootstrapcmd.cc root.cmd
OBJ += Bootstrapcmd.cc
Bootstrapclt : Bootstrapclt.o Bootstrapcltoui.o /usr/local/lib/libdasio.a
	$(CXX) -o Bootstrapclt -g Bootstrapclt.o Bootstrapcltoui.o -L/usr/local/lib -ldasio -lnl -ltm -lncurses
Bootstrapclt.o : Bootstrapcmd.cc
	$(CXX) -c -o Bootstrapclt.o -DCLIENT $(CXXFLAGS) Bootstrapcmd.cc
Bootstrapcltoui.cc : Bootstrapclt.oui
	oui -o Bootstrapcltoui.cc Bootstrapclt.oui
OBJ += Bootstrapclt Bootstrapclt.cc Bootstrapcltoui.cc

clean :
	rm -f $(OBJ)

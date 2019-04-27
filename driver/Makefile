LDFLAGS=-L/usr/local/lib
LIBS=-ldasio -lnl -lpthread
.PHONY : all clean

all : driver

driver : driver.o driveroui.o
	$(CXX) $(CXXFLAGS) -o driver driver.o driveroui.o $(LDFLAGS) $(LIBS)
driveroui.o : driveroui.cc
driveroui.cc : driver.oui
	oui -o driveroui.cc driver.oui
clean :
	rm -f *.o driveroui.cc driver

CXXFLAGS=-std=c++11
# LDFLAGS=-L/usr/local/lib
LIBS=-ldasio -lnl -lpthread
.PHONY : all clean

all : driver

driver : driver.o driveroui.o
	$(CXX) $(CXXFLAGS) -o driver driver.o driveroui.o $(AG_LDFLAGS) $(LIBS)
driveroui.o : driveroui.cc
driveroui.cc : driver.oui
	oui -o driveroui.cc driver.oui
clean :
	rm -f *.o driveroui.cc driver

include /usr/local/share/linkeng/appgen.mk

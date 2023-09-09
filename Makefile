# The C compiler
CC=gcc
CXX=g++

# Debug flags
DBG_CXXFLAGS=-g -Wall -Wno-sign-compare

# Optimization flags
OPT_CXXFLAGS=-O2 -Wall -Wno-sign-compare

# libraries
INCLUDES=-I./src

LNK=src/libsla.a
LNK_DBG=src/libsla_dbg.a

libsla.a:
	$(MAKE) -C src/ $@

libsla_dbg.a:
	$(MAKE) -C src/ $@

sleighexample.o:	sleighexample.cc
	$(CXX) -c $(DBG_CXXFLAGS) $(INCLUDES) $< -o $@

sleighexample:	sleighexample.o libsla.a
	$(CXX) $(DBG_CXXFLAGS) -o sleighexample sleighexample.o $(LNK)

sleighexample_dbg:	sleighexample.o libsla_dbg.a
	$(CXX) $(DBG_CXXFLAGS) -o sleighexample sleighexample.o $(LNK_DBG)

clean:
	rm -rf *.o sleighexample


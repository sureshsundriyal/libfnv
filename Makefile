PYTHON_VER = 2
PYTHON_CONFIG = python-config
CYTHON = cython

all: fnv-test sharedlib pythonlib

fnv-test: test/fnv-test.c fnv.c fnv.h
	gcc -O3 -I. -o test/fnv-test test/fnv-test.c fnv.c

sharedlib: fnv.h fnv.c
	gcc -O3 -c fnv.c -o fnv.o
	gcc -O3 -o libfnv.so -shared fnv.o

pythonlib: sharedlib fnv.pyx
	$(CYTHON) -$(PYTHON_VER) fnv.pyx -o fnv-py.c
	gcc -c fnv-py.c -o fnv-py.o `$(PYTHON_CONFIG) --cflags`
	gcc fnv-py.o fnv.o -o fnv.so -shared `$(PYTHON_CONFIG) --ldflags`

clean:
	rm -rf test/fnv-test libfnv.so fnv.{o,so} fnv-py.{c,o} libfnv.so.dSYM

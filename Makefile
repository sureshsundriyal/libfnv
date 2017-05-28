PYTHON_VER = 2
PYTHON_CONFIG = python-config
CYTHON = cython

all: fnv1a-test sharedlib pythonlib

fnv1a-test: fnv1a-test.c fnv1a.c fnv1a.h
	gcc -O3 -o fnv1a-test fnv1a-test.c fnv1a.c

sharedlib: fnv1a.h fnv1a.c
	gcc -O3 -c fnv1a.c -o fnv1a.o
	gcc -O3 -o libfnv1a.so -shared fnv1a.c

pythonlib: sharedlib fnv1a.pyx
	$(CYTHON) -$(PYTHON_VER) fnv1a.pyx -o fnv1a-py.c
	gcc -c fnv1a-py.c -o fnv1a-py.o `$(PYTHON_CONFIG) --cflags`
	gcc fnv1a-py.o fnv1a.o -o fnv1a.so -shared `$(PYTHON_CONFIG) --ldflags`

clean:
	rm -rf fnv1a-test libfnv1a.so fnv1a.o fnv1a-py.{c,o} fnv1a.so libfnv1a.so.dSYM

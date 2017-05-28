PYTHON_VER = 2
PYTHON_CONFIG = python-config
CYTHON = cython

all: fnv1a-test sharedlib pythonlib

fnv1a-test: fnv1a-test.c fnv.c fnv.h
	gcc -O3 -o fnv1a-test fnv1a-test.c fnv.c

sharedlib: fnv.h fnv.c
	gcc -O3 -c fnv.c -o fnv.o
	gcc -O3 -o libfnv.so -shared fnv.c

pythonlib: sharedlib fnv1a.pyx
	$(CYTHON) -$(PYTHON_VER) fnv1a.pyx -o fnv1a-py.c
	gcc -c fnv1a-py.c -o fnv1a-py.o `$(PYTHON_CONFIG) --cflags`
	gcc fnv1a-py.o fnv.o -o fnv.so -shared `$(PYTHON_CONFIG) --ldflags`

clean:
	rm -rf fnv1a-test libfnv.so fnv.o fnv1a-py.{c,o} fnv.so libfnv.so.dSYM

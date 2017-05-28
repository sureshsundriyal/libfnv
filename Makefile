BUILD_DIR = ./build
PYTHON_VER = 2
PYTHON_CONFIG = python-config
CYTHON = cython
PYTHON_DIR := ${BUILD_DIR}/python${PYTHON_VER}/site-packages

all: mkdir fnv-test sharedlib pythonlib

mkdir:
	mkdir -p ${BUILD_DIR}
	mkdir -p ${PYTHON_DIR}

fnv-test: test/fnv-test.c fnv.c fnv.h
	gcc -O3 -I. -o ${BUILD_DIR}/fnv-test test/fnv-test.c fnv.c

sharedlib: fnv.h fnv.c
	gcc -O3 -c fnv.c -o ${BUILD_DIR}/fnv.o
	gcc -O3 -o ${BUILD_DIR}/libfnv.so -shared ${BUILD_DIR}/fnv.o

pythonlib: sharedlib fnv.pyx
	$(CYTHON) -$(PYTHON_VER) fnv.pyx -o ${BUILD_DIR}/fnv-py.c
	gcc -c -I. ${BUILD_DIR}/fnv-py.c -o ${BUILD_DIR}/fnv-py.o `$(PYTHON_CONFIG) --cflags`
	gcc ${BUILD_DIR}/fnv-py.o ${BUILD_DIR}/fnv.o -o ${PYTHON_DIR}/fnv.so -shared `$(PYTHON_CONFIG) --ldflags`

clean:
	rm -rf build libfnv.so.dSYM

.PHONY: all mkdir

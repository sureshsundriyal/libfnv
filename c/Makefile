all: fnv1a-test sharedlib

fnv1a-test: fnv1a-test.c fnv1a.c fnv1a.h
	gcc -O3 -o fnv1a-test fnv1a-test.c fnv1a.c

sharedlib: fnv1a.h fnv1a.c
	gcc -O3 -c fnv1a.c
	gcc -O3 -o libfnv1a.so -shared fnv1a.c

clean:
	rm -f fnv1a-test libfnv1a.so fnv1a.o

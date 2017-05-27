cdef extern from "<stdint.h>" nogil:
    ctypedef unsigned long long uint64_t

cdef extern from "c/fnv1a.h":
    void fnv1a(const char *foo, const int length, uint64_t *hash);


def test():
    cdef uint64_t x = <uint64_t>0
    fnv1a("hello world", len("hello world") + 1, &x)
    print x

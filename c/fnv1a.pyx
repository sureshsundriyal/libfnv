cdef extern from "<stdint.h>" nogil:
    ctypedef unsigned long long uint64_t

cdef extern from "fnv1a.h":
    void fnv1a(const char *foo, const int length, uint64_t *hash)

cdef class fnv1a64:

    cdef readonly uint64_t h
    name        = "fnv1a64"
    digestsize  = 8
    digest_size = 8

    def __cinit__(self, s=None):
        self.h = <uint64_t>0
        if s is not None:
            fnv1a(s, len(s), &self.h)

    cpdef void update(self, const char *s):
        fnv1a(s, len(s), &self.h)

    cpdef unsigned long long digest(self):
        return self.h

    cpdef char * hexdigest(self):
        return b'%x' % self.h

    cpdef void reset(self):
        self.h = <uint64_t>0

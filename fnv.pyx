cdef extern from "<stdint.h>" nogil:
    ctypedef unsigned long long uint64_t

cdef extern from "fnv.h":
    void c_fnv1_64 "fnv1_64"(const char *msg,
                               const int length,
                               uint64_t *hash)

    void c_fnv1a_64 "fnv1a_64"(const char *msg,
                               const int length,
                               uint64_t *hash)

cdef class fnv1_64:

    cdef readonly uint64_t h
    name        = "fnv1_64"
    digestsize  = 8
    digest_size = 8

    def __cinit__(self, s=None):
        self.h = <uint64_t>0
        if s is not None:
            c_fnv1_64(s, len(s), &self.h)

    cpdef void update(self, const char *s):
        c_fnv1_64(s, len(s), &self.h)

    cpdef unsigned long long digest(self):
        return self.h

    cpdef char * hexdigest(self):
        return b'%x' % self.h

    cpdef void reset(self):
        self.h = <uint64_t>0

cdef class fnv1a_64:

    cdef readonly uint64_t h
    name        = "fnv1a_64"
    digestsize  = 8
    digest_size = 8

    def __cinit__(self, s=None):
        self.h = <uint64_t>0
        if s is not None:
            c_fnv1a_64(s, len(s), &self.h)

    cpdef void update(self, const char *s):
        c_fnv1a_64(s, len(s), &self.h)

    cpdef unsigned long long digest(self):
        return self.h

    cpdef char * hexdigest(self):
        return b'%x' % self.h

    cpdef void reset(self):
        self.h = <uint64_t>0

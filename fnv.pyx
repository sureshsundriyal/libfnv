# Author: Suresh Sundriyal
# License: CC0 - No rights reserved.

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
    cdef uint64_t h
    cdef readonly char *name
    cdef readonly uint64_t blocksize
    cdef readonly uint64_t digestsize
    cdef readonly uint64_t digest_size

    def __cinit__(self, s=None):
        self.h              = <uint64_t>0
        self.name           = "fnv1_64"
        self.blocksize      = <uint64_t>64
        self.digestsize     = <uint64_t>8
        self.digest_size    = <uint64_t>8
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
    cdef uint64_t h
    cdef readonly char *name
    cdef readonly uint64_t blocksize
    cdef readonly uint64_t digestsize
    cdef readonly uint64_t digest_size

    def __cinit__(self, s=None):
        self.h              = <uint64_t>0
        self.name           = "fnv1a_64"
        self.blocksize      = <uint64_t>64
        self.digestsize     = <uint64_t>8
        self.digest_size    = <uint64_t>8
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

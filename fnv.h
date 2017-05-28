#include<stdint.h>

#ifndef FNV
#define FNV
void fnv1_64(const char *msg, const int length, uint64_t *hash);
void fnv1a_64(const char *msg, const int length, uint64_t *hash);
#endif

#include "fnv1a.h"

static const uint64_t fnv_prime = 0x100000001B3L;

void fnv1a(const char *foo, const int length, uint64_t *hash) {
	int len = 0;

	if (*hash == 0L) {
		*hash = 0xcbf29ce484222325L;
	}

	while (len < length) {
		*hash = ( (*hash ^ foo[len++]) * fnv_prime )
			& 0xffffffffffffffff;
	}
}

#include "fnv.h"

static const uint64_t fnv_prime = 0x100000001B3L;

void fnv1_64(const char *msg, const int length, uint64_t *hash) {
	int len = 0;

	if (*hash == 0L) {
		*hash = 0xcbf29ce484222325L;
	}

	while (len < length) {
		*hash = ( (*hash * fnv_prime) ^ msg[len++] )
			& 0xffffffffffffffff;
	}
}

void fnv1a_64(const char *msg, const int length, uint64_t *hash) {
	int len = 0;

	if (*hash == 0L) {
		*hash = 0xcbf29ce484222325L;
	}

	while (len < length) {
		*hash = ( (*hash ^ msg[len++]) * fnv_prime )
			& 0xffffffffffffffff;
	}
}

// Author: Suresh Sundriyal
// License: CC0 - No rights reserved.

#include "fnv.h"

static const uint64_t fnv_prime_64  = 0x100000001B3L;
static const uint64_t fnv_offset_64 = 0xcbf29ce484222325L;

void fnv1_64(const char *msg, const int length, uint64_t *hash) {
	int len = 0;

	if (*hash == 0L) {
		*hash = fnv_offset_64;
	}

	while (len < length) {
		*hash = ( (*hash * fnv_prime_64) ^ msg[len++] );
	}
}

void fnv1a_64(const char *msg, const int length, uint64_t *hash) {
	int len = 0;

	if (*hash == 0L) {
		*hash = fnv_offset_64;
	}

	while (len < length) {
		*hash = ( (*hash ^ msg[len++]) * fnv_prime_64 );
	}
}

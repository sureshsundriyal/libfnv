#include "fnv1a.h"
#include <stdio.h>

int main(void) {
	char foo[] = "hello world";
	uint64_t hash = 0L;
	fnv1a(foo, sizeof foo - 1, &hash);
	printf("%llu\n", hash);

	// Test for progressive hashing.
	uint64_t hash2 = 0L;
	char foo2[] = "hello ";
	fnv1a(foo2, sizeof foo2 - 1, &hash2);
	char foo3[] = "world";
	fnv1a(foo3, sizeof foo3 - 1, &hash2);
	printf("%llu\n", hash2);

	return 0;
}

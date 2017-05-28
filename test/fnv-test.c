#include "fnv.h"
#include <stdio.h>

int main(void) {
	char foo[] = "hello world";
	char foo2[] = "hello ";
	char foo3[] = "world";

	uint64_t hash = 0L;
	fnv1a_64(foo, sizeof foo - 1, &hash);
	printf("fnv1a_64: %llu\n", hash);

	// Test for progressive hashing.
	uint64_t hash2 = 0L;
	fnv1a_64(foo2, sizeof foo2 - 1, &hash2);
	fnv1a_64(foo3, sizeof foo3 - 1, &hash2);
	printf("fnv1a_64: %llu\n", hash2);

	uint64_t hash3 = 0L;
	fnv1_64(foo, sizeof foo - 1, &hash3);
	printf("fnv1_64: %llu\n", hash3);

	uint64_t hash4 = 0L;
	fnv1_64(foo2, sizeof foo2 - 1, &hash4);
	fnv1_64(foo3, sizeof foo3 - 1, &hash4);
	printf("fnv1_64: %llu\n", hash4);

	return 0;
}

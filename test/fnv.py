# Author: Suresh Sundriyal
# License: CC0 - No rights reserved.

import struct

def fnv(byte_string):
    #fnv_prime = 309485009821345068724781371
    #fnv_offset_basis = 144066263297769815596495629667062367629
    fnv_prime = 1099511628211
    fnv_offset_basis = 14695981039346656037
    for _byte in byte_string:
        try:
            _byte = struct.unpack('B', _byte)[0]
        except:
            pass
        fnv_offset_basis =  (( fnv_offset_basis ^ _byte ) *
                                fnv_prime ) & 0xffffffffffffffff
    return fnv_offset_basis

print(fnv(b'hello world'))

# A cached generator is spent after the first call: later callers get
# an empty iterator. Flag lru_cache on generators; caching plain
# functions (or uncached generators) is fine.
import functools


# ruleid: cannot-cache-generators
@functools.lru_cache()
def gen_items(n):
    yield n


# ruleid: cannot-cache-generators
@functools.lru_cache(maxsize=128)
def gen_more(n):
    yield n
    yield n + 1


# ruleid: cannot-cache-generators
@functools.lru_cache()
def gen_again(n):
    for i in range(n):
        yield i


# ok: cannot-cache-generators
def plain_gen(n):
    yield n


# ok: cannot-cache-generators
@functools.cache
def compute_cached(n):
    return n + 1


# ok: cannot-cache-generators
@functools.lru_cache()
def compute(n):
    return n + 1

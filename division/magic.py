def magic(divisor, ilog):
    return (2**ilog + divisor - 1) // divisor

def split64to32(u64):
    return (u64 >> 32, u64 & 0xFFFFFFFF)

def ihex32(h):
    if h & 0x80000000:
        h = -((h ^ 0xffffffff) + 1)
    return hex(h)

def from_ihex(ih):
    ih = int(ih, 16)
    if ih < 0:
        ih = -((ih ^ 0xffffffff) + 1)
    return ih

def concat32to64(hi, lo):
    return hi * 2**32 + lo

def divisor_from_magic(magic, ilog):
    return (2**ilog + magic - 1) // magic
    

print(hex(magic(3256, 43)))
print(hex(magic(3256, 75)))
(hi, lo) = split64to32(magic(3256, 75))
print(ihex32(hi), ihex32(lo))

print(divisor_from_magic(concat32to64(from_ihex('0x2bb0cf'), from_ihex('-0x78263ab5')), 65))

(hi, lo) = split64to32(magic(2999, 65))
print(ihex32(hi), ihex32(lo))

(hi, lo) = split64to32(magic(3000, 65))
print(ihex32(hi), ihex32(lo))
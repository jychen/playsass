#include "cuda.h"

__global__ void madlo_kernel(uint32_t *a)
{
    a[0] = a[0] * a[1];
}

__global__ void madwide_kernel(uint32_t *a)
{
    uint32_t b = (uint64_t)a[0] * (uint64_t)a[1] >> 32;
    a[0] = b;
}

__global__ void mad_ptx_kernel(uint32_t *a, uint32_t *b)
{
    uint64_t result;
    asm volatile("mad.wide.u32 %0, %1, %2, %3 ;\n" : "=l"(result) : "r"(a[0]), "r"(a[1]), "l"(*(uint64_t *)a));
    b[0] = result & 0xFFFFFFFF;
    b[1] = result >> 32;
}

__global__ void mad_cc_ptx_kernel(uint32_t *a, uint32_t *b)
{
    uint32_t result[5] = {0};
    asm volatile("mad.lo.cc.u32 %0, %5, %6, %7 ;\n"
                 "madc.hi.cc.u32 %1, %5, %6, %8 ;\n" 
                 "madc.lo.cc.u32 %2, %9, %10, %11;\n"
                 "madc.hi.cc.u32 %3, %9, %10, %12;\n"
                 "addc.cc.u32 %4, %13, %14 ;\n"
                 : "=r"(result[0]), "=r"(result[1]), "=r"(result[2]), "=r"(result[3]), "=r"(result[4])
                 : "r"(a[0]), "r"(b[0]), "r"(0), "r"(0), "r"(a[1]), "r"(b[1]), "r"(0), "r"(0), "r"(0), "r"(0));
    for (uint32_t i = 0; i < 5; i++) {
        b[i] = result[i];
    }
}


int main(int argc, char **argv)
{
    madlo_kernel<<<1, 1>>>(NULL);
    madwide_kernel<<<1, 1>>>(NULL);
    mad_ptx_kernel<<<1, 1>>>(NULL, NULL);
    return 0;
}

/**
 * IMAD d, a, b, c ;                        d = a * b + c
 * IMAD.WIDE.U32 d, P, a, b, c ;            d = a * b + c, P = carryOut
 * IMAD.WIDE.U32.X d, a, b, c, P ;          d = a * b + c + P
 * IMAD.WIDE.U32.X d, P1, a, b, c, P2 ;     d = a * b + c + P2, P1 = carryOut
*/
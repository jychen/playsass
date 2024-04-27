#include "cuda.h"

__global__ void lea_kernel(uint32_t *a, uint32_t off1, uint32_t off2)
{
    a[0] = a[(off1 << 8) + off2];
}


int main(int argc, char **argv)
{
    uint32_t off1 = atoi(argv[1]);
    uint32_t off2 = atoi(argv[2]);
    lea_kernel<<<1, 1>>>(NULL, off1, off2);
    return 0;
}


/**
 * LEA d, a, b, c ;                             d = (a << c) + b
 * LEA dst, carry, index, base, shift;          (dst, carry) = base + lo(index << shift)
 * LEA.HI dst, index, baseHi, shift, carry;     dst = baseHi + hi(index << shift) + carry
*/
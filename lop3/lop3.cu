#include "cuda.h"

__global__ void and_kernel(int *a, int b)
{
    a[0] = a[0] & b;
}

__global__ void xor_kernel(int *a, int b)
{
    a[0] ^= b;
}

__global__ void or_kernel(int *a, int b)
{
    a[0] |= b;
}

__global__ void and3_kernel(int *a, int b, int c)
{
    a[0] &= b & c;
}

__global__ void xor3_kernel(int *a, int b, int c)
{
    a[0] ^= b ^ c;
}

__global__ void or3_kernel(int *a, int b, int c)
{
    a[0] |= b | c;
}

__global__ void andnot_kernel(int *a, int b)
{
    a[0] = ~a[0] & b;
}

__global__ void xorandnot_kernel(int *a, int b, int c)
{
    a[0] = a[0] ^ (~b & c);
}

int main(int argc, char **argv)
{
    return 0;
}


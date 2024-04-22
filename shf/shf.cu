#include "cuda.h"

__global__ void shr_const_kernel(uint32_t *a)
{
    a[0] >>= 3;
}

__global__ void shr_var_kernel(uint32_t *a, int b)
{
    a[0] >>= b;
}

__global__ void shl_const_kernel(uint32_t *a)
{
    a[0] <<= 3;
}

__global__ void shl_var_kernel(uint32_t *a, int b)
{
    a[0] <<= b;
}

int main(int argc, char **argv)
{
    shr_const_kernel<<<1, 1>>>(NULL);
    shr_var_kernel<<<1, 1>>>(NULL, 20);
    shl_const_kernel<<<1, 1>>>(NULL);
    shl_var_kernel<<<1, 1>>>(NULL, 20);
    return 0;
}


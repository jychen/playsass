#include "cuda.h"

#define DIVISOR 3256

__global__ void divide_by_const(uint32_t *a)
{
    a[0] = a[0] / DIVISOR;
}

__global__ void divide_by_const_64(uint64_t *a)
{
    a[0] = a[0] / DIVISOR;
}

__global__ void mod_by_const_64(uint64_t *a)
{
    a[0] = a[0] % DIVISOR;
}

__global__ void divide_by_var(uint32_t *a, uint32_t b)
{
    a[0] = a[0] / b;
}

__global__ void divide_by_var_64(uint64_t *a, uint64_t b)
{
    a[0] = a[0] / b;
}

int main(int argc, char **argv)
{
    uint32_t var = atoi(argv[1]);
    divide_by_const<<<1, 1>>>(NULL);
    divide_by_var<<<1, 1>>>(NULL, var);
    return 0;
}
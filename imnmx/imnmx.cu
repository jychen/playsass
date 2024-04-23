#include "cuda.h"

__global__ void max_kernel(int *a, int b)
{
    *a = max(*a, b);
}

__global__ void min_kernel(int *a, int b)
{
    *a = min(*a, b);
}

int main(int argc, char **argv)
{
    return 0;
}


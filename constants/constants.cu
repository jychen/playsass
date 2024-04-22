#include "cuda.h"

__global__ void constant_gridDim_x(int *a)
{
    *a = gridDim.x;
}

__global__ void constant_blockDim_x(int *a)
{
    *a = blockDim.x;
}

int main(int argc, char **argv)
{
    return 0;
}


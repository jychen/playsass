#include "cuda.h"

__global__ void syncthreads_kernel()
{
    __syncthreads();
}

__global__ void threadfence_kernel()
{
    __threadfence();
}
int main(int argc, char **argv)
{
    return 0;
}


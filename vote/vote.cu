#include "cuda.h"

__global__ void vote_any_kernel(int *a, int b)
{
    *a = __any_sync(0xFFFFFFFF, b >> threadIdx.x);
}

__global__ void ballot_sync_kernel(int *a, int b)
{
    *a = __ballot_sync(0xFFFFFFFF, b >> threadIdx.x);
}

int main(int argc, char **argv)
{
    return 0;
}


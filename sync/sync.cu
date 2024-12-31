#include "cuda.h"
#include <cooperative_groups.h>
#include <cooperative_groups/memcpy_async.h>

__global__ void syncthreads_kernel()
{
    __syncthreads();
}

__global__ void threadfence_kernel()
{
    __threadfence();
}

__global__ void groupsync_kernel(int *a, int b)
{
    auto g = cooperative_groups::this_grid();
    g.sync();
    if (threadIdx.x == 0) *a = b;
}

__global__ void warpsync_kernel(int *a)
{
    auto warp = cooperative_groups::coalesced_threads();
    warp.sync();
    if (threadIdx.x == 0) *a = 100;
}

int main(int argc, char **argv)
{
    return 0;
}


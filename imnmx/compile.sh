PROGRAM=imnmx
nvcc $PROGRAM.cu -gencode arch=compute_86,code=sm_86
cuobjdump -sass a.out > $PROGRAM.sass
rm a.out
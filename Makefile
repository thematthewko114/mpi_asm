INC = -I/usr/local/include -I/usr/share/CUnit/include
LIB = -L/usr/local/lib -L/usr/share/CUnit/lib
SIMD = -msse -mmmx -msse2

all:  runtest asgn1c generateDataset

runtest:util.c runtest.c WjCryptLib/WjCryptLib_Rc4.c
	gcc $^ -o runtest $(INC) $(LIB) -lcunit -std=c99 -O3

generateDataset:util.c generateDataset.c WjCryptLib/WjCryptLib_Rc4.c
	gcc $^ -o generateDataset $(INC) $(LIB) -std=c99 -O3

asgn1c: util.c asgn1c.c WjCryptLib/WjCryptLib_Rc4.c
	mpicc $^ -o asgn1c $(INC) $(LIB) $(SIMD) -lcunit -pthread -fopenmp -std=c99 -O3

clean:
	rm -rf runtest generateDataset asgn1c

FC=gfortran
FFLAGS=-O3 -Wall -Wextra
#MODULES=quadratic.f90
PROG=quadratic.f90
SRC=$(MODULES) $(PROG)
OBJ=${SRC:.f90=.o}
BASE=${SRC:.f90=}

all: clean quadratic

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

quadratic: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
	rm -f *.o *.mod $(BASE)

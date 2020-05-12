# LWPC v.2.1

SPAWAR LWPC Longwave Propagation Code v.2.1 was
[described](http://www.spawar.navy.mil/sti/publications/pubs/td/3030/td3030.pdf),
[validated](https://agupubs.onlinelibrary.wiley.com/doi/abs/10.1029/2010JA016248),
and
[used](https://journals.ametsoc.org/doi/full/10.1175/JTECH-D-11-00174.1)
by numerous authors.
Here we present a Python interface to the original Fortran code.

Minimum edits to source to compile on modern (non-Watcom) Fortran compilers such as Gfortan.

## Build

```sh
cmake -B build
cmake --build build
```

## Run

```sh
./lwpc
```

the file `output/lwpm.lwf` is created with the simulation output, the console says "Normal run complete" and stderr is 0.

### Examples

Several example inputs are provided:

```sh
./lwpc ../gcpath

./lwpc ../lwpm

./lwpc ../jammer

./lwpc ../bearings

./lwpc ../lwflds
```

## Read output

```sh
./scan

../output lwpc.lwf
```

will create text file "scan.log" that will help confirm the simulation was run correctly.

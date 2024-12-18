# Assembly - minilibc

Here is a second year project in assembly. It consists of a library of simple C functions in assembly.

# Build

First you have to get nasm in order to compile assembly files
```
sudo apt-get install nasm
```
Then you have to compile using **make** :
```
make
```
Then you get a dynamic library names libasm.so


# Use

You simply have to link the library with your sources files
```
gcc -Wall -o test main.c -lfoo
```


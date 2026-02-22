# SM64 Injection Template

SM64 Injection Template by AmitabhTechz, Xerox and CalebV64.

This is an example setup for injecting data into SM64. This template can also be utilised for other things, aside from SM64.

Entropy from compilers or assemblers (object files) can be injected using armips, the linker used here. It can also be used for raw data, and Assembly.

C is mostly used as an example here, since it is the easiest and has plentiful documentation to be used with SM64.

# Dependencies

### The following tools are required to build (for NT and GNU/Linux atleast):

* GNU toolchain
* MSYS2 or any MingW64 subsystem (for NT)
* Python >= 3

# Folder Format
```
src/ .............. Source files, some headers

include/sm64 ...... Header (.h) files
asm/............... Assembly files with addresses

inject.asm ........ Linker tasks, bootstrap code, hook inserts

obj/ .............. Object (.o) files
```

# Licensing

SM64 Injection Template is released under the Zero Clause BSD license. See the file LICENSE for more details.

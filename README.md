This repository contains an example of a library written in
OCaml/Reason for both JavaScript (through [Melange](melange.re/)) and native
(through the OCaml compiler).

The `shared` directory contains the core of the library, available in
both modes. `js` and `native` contain the part specific to one
implementation of the library.

The library is composed of 3 modules:

- `Date`, which has an implementation per platform and can have a
  different interface per platform.
- `Tomorrow`, which has one implementation shared for both platforms.
- `Yesterday`, which has a signature shared by both platforms, but an
  implementation per platform.

There is companion [blog
post](https://tech.ahrefs.com/how-to-write-a-library-for-bucklescript-and-native-22f45e5e946d)
giving more details on how to create this kind of library step by
step.

## Installation

Installing requires [opam](opam.ocaml.org/), OCaml's package manager. Once it is
installed, just needs to run:

```bash
make init
```

## Compilation

For Melange:

```bash
dune build @melange
```

For native

```bash
dune build exes/native.exe
```

The commands are wrapped in a Makefile and can be called with `make
melange` and `make native`.

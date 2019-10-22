This repository contains an example of a library written in
ocaml/reason for both javascript (through bucklescript) and native
(through the ocaml compiler).

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

For bucklescript:

```bash
yarn
```

For native:

- install [esy](https://esy.sh/)
- then run `esy install`

It can work with opam, but we use esy in this example as it is easier
to understand for people from the javascript world.

## Compilation

For bucklescript:

```bash
yarn bsb -make-world
```

For native

```bash
esy dune build @all
```

The commands are wrapped in a Makefile and can be called with `make
js` and `make native`.

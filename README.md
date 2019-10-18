This repository contains an example of a library written in
ocaml/reason for both javascript (through bucklescript) and native
(through the ocaml compiler).

The `shared` directory contains the core of the library, available in
both modes. `js` and `native` contain the part specific to one
implementation of the library.

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

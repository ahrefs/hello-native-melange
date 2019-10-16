.PHONY: js native clean

js:
	yarn bsb -make-world

native:
	dune build @all

clean:
	dune clean
	yarn bsb -clean-world

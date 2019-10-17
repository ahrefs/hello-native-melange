.PHONY: js native clean

js:
	yarn bsb -make-world

native:
	esy dune build @all

clean:
	esy dune clean
	yarn bsb -clean-world

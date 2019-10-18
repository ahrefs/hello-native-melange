.PHONY: js native clean

default:
	@@echo "use 'make js' or 'make native'"

js:
	yarn bsb -make-world

native:
	esy dune build @all

clean:
	esy dune clean
	yarn bsb -clean-world

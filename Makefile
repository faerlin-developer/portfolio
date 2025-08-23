run:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs faerlin-developer/mkdocs-material

build:
	docker build -t faerlin-developer/mkdocs-material .

new:
	docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material new .
	
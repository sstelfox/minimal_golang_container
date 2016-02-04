
all: minimal_container

build_container: docker_files/Dockerfile.build
	docker build -t test:gobase --pull=true -f docker_files/Dockerfile.build .

minimal_container: docker_files/Dockerfile.minimal output/main
	docker build -t test:latest -f docker_files/Dockerfile.minimal .

output/:
	mkdir output/

output/main: build_container output/ main.go
	docker run -v $$(pwd):/app:rw,Z test:gobase build -a -installsuffix cgo -o output/main .

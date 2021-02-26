IMAGE=deepstream_python
CONTAINER=deepstream_python
TAG=latest

build:
	docker build -t $(IMAGE):$(TAG) .
run:
	xhost +
	docker run -it \
		--rm \
		--net=host \
		--gpus all \
		--runtime nvidia \
		--name $(CONTAINER) \
		--device=/dev/video0:/dev/video0 \
		-e DISPLAY=$(DISPLAY) \
		-w /opt/nvidia/deepstream/deepstream/sources/python/apps \
		-v `pwd`:/opt/nvidia/deepstream/deepstream/sources/python/apps \
		-v /tmp/.X11-unix/:/tmp/.X11-unix \
		$(IMAGE):$(TAG)
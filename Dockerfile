FROM nvcr.io/nvidia/deepstream-l4t:5.1-21.02-samples

RUN apt-get update && apt-get install -y python3-dev \
    python3-gst-1.0 \
    python3-gi \
    make
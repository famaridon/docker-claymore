FROM nvidia/cuda:8.0-devel-ubuntu16.04

# Claymore suggested flags
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENV DCRI=30

# Mining mode [0: Dual, 1: Eth]
ENV MODE=0
# Detect GPU indexes automatically
ENV DI=detect
# Improve stability in multi-GPU systems
ENV GSER=1

# Install various libs
RUN apt-get update && \
	apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --no-install-recommends apt-transport-https wget ca-certificates ocl-icd-opencl-dev curl libcurl3 unzip &&\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get claymore
ADD https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v9.6/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v9.6.-.LINUX.tar.gz /claymore.tar.gz
RUN mkdir /claymore && \
	tar -xvzf claymore.tar.gz --directory /claymore && \
	rm -f /claymore.tar.gz && \
	mkdir /claymore/config

# Start claymore

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME [/claymore/config]
ENTRYPOINT /entrypoint.sh

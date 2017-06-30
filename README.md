# docker-claymore

Assuming the nvidia-docker plugin are properly installed ([see installation](https://github.com/NVIDIA/nvidia-docker))

# Quick start

## clone this repository
```
git clone https://github.com/famaridon/docker-claymore.git
```
## Build docker image
```
docker image build -t famaridon/docker-claymore .
```
## Update setting for nanopool 
Generate claymore_config_nanopool.zip from https://nanopool.org/ and ```overwrite the config/claymore_config_nanopool.zip```

## Run docker 
```
nvidia-docker run -it -d --name docker-claymore -v /home/derf/docker/docker-claymore/config:/claymore/config famaridon/docker-claymore
```

or with auto restart 

```
nvidia-docker run -it -d --restart always --name docker-claymore -v /home/derf/docker/docker-claymore/config:/claymore/config famaridon/docker-claymore
```

 Change ```/home/derf/docker/docker-claymore``` to your clone directory.
 
 ## Have fun

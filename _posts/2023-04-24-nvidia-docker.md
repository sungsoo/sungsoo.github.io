---
layout: post
title: Installing and Using NVIDIA Docker   
date: 2023-04-24
categories: [computer science]
tags: [big data]

---

### Article Source

* [Installing and Using NVIDIA Docker](https://www.youtube.com/watch?v=jdip_6vTw0s)


---

# Installing and Using NVIDIA Docker

<iframe width="600" height="400" src="https://www.youtube.com/embed/jdip_6vTw0s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Commands

## Install Docker
```
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
```

## Install NVIDIA Docker
```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
```

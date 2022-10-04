---
layout: post
title: InferenceService using a Custom Torchserve Image 
date: 2022-10-02
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Predict on a InferenceService using a Custom Torchserve Image](https://github.com/kserve/kserve/tree/master/docs/samples/v1beta1/custom/torchserve#readme)


---


# Predict on a InferenceService using a Custom Torchserve Image

In this example we use torchserve as custom server to serve an mnist model. The idea of using torchserve as custom server is to make the transition for new users from torchserve to kfserving easier.

## Setup

1. Your ~/.kube/config should point to a cluster with [KServe installed](https://github.com/kserve/kserve#installation).
2. Your cluster's Istio Ingress gateway must be [network accessible](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/).

### This example requires v1beta1/KFS 0.5

## Build and push the sample Docker Image

The custom torchserve image is wrapped with model inside the container and serves it with KServe.

In this example we build a torchserve image with marfile and config.properties into a container. To build and push with Docker Hub, run these commands replacing {username} with your Docker Hub username:

Refer steps for [building and publishing](./torchserve-image/README.md) docker image.

## Create the InferenceService

In the `torchserve-custom.yaml` file edit the container image and replace {username} with your Docker Hub username.

Apply the CRD

```bash
kubectl apply -f torchserve-custom.yaml
```

Expected Output

```bash
$inferenceservice.serving.kubeflow.org/torchserve-custom created
```

## Run a prediction

The first step is to [determine the ingress IP and ports](https://kserve.github.io/website/master/get_started/first_isvc/#4-determine-the-ingress-ip-and-ports) and set `INGRESS_HOST` and `INGRESS_PORT`

Download input image:

wget https://raw.githubusercontent.com/pytorch/serve/master/examples/image_classifier/mnist/test_data/0.png

```bash
MODEL_NAME=torchserve-custom
SERVICE_HOSTNAME=$(kubectl get inferenceservice ${MODEL_NAME} -n <namespace> -o jsonpath='{.status.url}' | cut -d "/" -f 3)

curl -v -H "Host: ${SERVICE_HOSTNAME}" http://${INGRESS_HOST}:${INGRESS_PORT}/predictions/mnist -T 0.png
```

Expected Output

```bash
*   Trying 52.89.19.61...
* Connected to a881f5a8c676a41edbccdb0a394a80d6-2069247558.us-west-2.elb.amazonaws.com (52.89.19.61) port 80 (#0)
> PUT /predictions/mnist HTTP/1.1
> Host: torchserve-custom.kfserving-test.example.com
> User-Agent: curl/7.47.0
> Accept: */*
> Content-Length: 272
> Expect: 100-continue
>
< HTTP/1.1 100 Continue
* We are completely uploaded and fine
< HTTP/1.1 200 OK
< cache-control: no-cache; no-store, must-revalidate, private
< content-length: 1
< date: Fri, 23 Oct 2020 13:01:09 GMT
< expires: Thu, 01 Jan 1970 00:00:00 UTC
< pragma: no-cache
< x-request-id: 8881f2b9-462e-4e2d-972f-90b4eb083e53
< x-envoy-upstream-service-time: 5018
< server: istio-envoy
<
* Connection #0 to host a881f5a8c676a41edbccdb0a394a80d6-2069247558.us-west-2.elb.amazonaws.com left intact
0
```

## For Autoscaling

Configurations for autoscaling pods [Auto scaling](docs/autoscaling.md)

## Canary Rollout

Configurations for canary [Canary Deployment](docs/canary.md)

## Log aggregation

Follow the link for torchserve log aggregation in kubernetes.
[Log aggregation with EFK Stack](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-elasticsearch-fluentd-and-kibana-efk-logging-stack-on-kubernetes)

---

# Docker image building

## Steps:

 1. Download model archive file from the [model-zoo](https://github.com/pytorch/serve/blob/master/docs/model_zoo.md) or create you own using the step provided [here](https://github.com/pytorch/serve/blob/master/model-archiver/README.md)
 2. Copy model archive files to model-store folder
 3. Edit config.properties for requirement
 4. Run docker build
 5. Publish the image to dockerhub repo

```bash
# For CPU:
DOCKER_BUILDKIT=1 docker build --file Dockerfile -t torchserve:latest .

# For GPU:
DOCKER_BUILDKIT=1 docker build --file Dockerfile --build-arg BASE_IMAGE=nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04 -t torchserve-gpu:latest .

docker push {username}/torchserve:latest
```

---

# Torchserve with external storage

For running torchserve with external storage, the model archive files and config.properties should be copied to the storage.

The storage mount to ```/mnt/models``` directory.

## Folder structure

```json
├──config.properties
├── model-store
│   ├── mnist.mar
|   ├── densenet161.mar
```

The entrypoint should be modified, to start torchserve with config.properties in ```/mnt/models``` path.

## Create PV and PVC

This document uses amazonEBS PV

### Create PV

Edit volume id in pv.yaml file

```bash
kubectl apply -f pv.yaml
```

Expected Output

```bash
persistentvolume/model-pv-volume created
```

### Create PVC

```bash
kubectl apply -f pvc.yaml
```

Expected Output

```bash
persistentvolumeclaim/model-pv-claim created
```

### Create PV Pod

```bash
kubectl apply -f pvpod.yaml
```

Expected Output

```bash
pod/model-store-pod created
```

Generate marfile from [here](https://github.com/pytorch/serve/tree/master/examples/image_classifier/mnist)

### Copy mar file and config properties to storage

Copy Marfile

```bash
kubectl exec --tty pod/model-store-pod -- mkdir /pv/model-store/
kubectl cp mnist.mar model-store-pod:/pv/model-store/mnist.mar
```

Copy config.properties

```bash
kubectl exec --tty pod/model-store-pod -- mkdir /pv/config/
kubectl cp config.properties model-store-pod:/pv/config/config.properties
```

### Delete pv pod

Since amazon EBS provide only ReadWriteOnce mode

## Create the InferenceService

In the `torchserve-custom-pv.yaml` file edit the container image with your Docker image and add your pv storage.

Apply the CRD

```bash
kubectl apply -f torchserve-custom-pv.yaml
```

Expected Output

```bash
$inferenceservice.serving.kubeflow.org/torchserve-custom-pv created
```

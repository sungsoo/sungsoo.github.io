---
layout: post
title: GPU Acceleration in Kubernetes with Jellyfin  
date: 2025-04-24
categories: [artificial intelligence]
tags: [parallel computing]

---

## Article Source


* [GPU Acceleration in Kubernetes with Jellyfin (or Anything!) - Intel, Nvidia, AMD](https://www.youtube.com/watch?v=YxDaDOzeN9E)

---

# [GPU Acceleration in Kubernetes with Jellyfin (or Anything!) - Intel, Nvidia, AMD](https://www.youtube.com/watch?v=YxDaDOzeN9E)

## Abstract

GPU acceleration is an important feature for homelabbing, and likely something that is holding you back from migrating completely to Kubernetes. In this video I show you how to passthrough a GPU into your cluster and enable hardware acceleration. This is great for things like hardware transcoding in Jellyfin/Plex, and anything else that can benefit from a GPU.

* Video Instructions:
[https://github.com/JamesTurland/JimsGarage/tree/main/Kubernetes/GPU-Passthrough](https://github.com/JamesTurland/JimsGarage/tree/main/Kubernetes/GPU-Passthrough)

* Nvidia & GPU - Official Instructions:
[https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/](https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/)

* Recommended Hardware: 
[https://github.com/JamesTurland/JimsGarage/blob/main/Homelab-Buyer's-Guide/Q3-2023.md](https://github.com/JamesTurland/JimsGarage/blob/main/Homelab-Buyer's-Guide/Q3-2023.md)

<iframe width="600" height="400" src="https://www.youtube.com/embed/YxDaDOzeN9E?si=PKnpvq7MtqLCFn_b" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## 주요 요약

- Kubernetes에서 GPU 가속화를 지원하려면 디바이스 플러그인을 사용해 GPU를 리소스로 등록하고, 노드를 라벨링하며, 파드가 GPU를 요청하도록 설정해야 합니다.  
- NVIDIA와 AMD GPU가 주로 사용되며, NVIDIA의 경우 NVIDIA Device Plugin과 GPU Operator가 유용합니다.  
- GPU 공유를 위해 Time-Slicing, MIG, CUDA MPS 같은 기술을 활용할 수 있습니다.  
- 클라우드 환경(GKE 등)에서는 GPU 노드 풀을 생성하고 드라이버를 관리해야 합니다.  
- 연구는 NVIDIA Run:ai 같은 도구가 AI 워크로드에서 효율성을 높인다고 제안합니다.  

---

## GPU 가속화 지원 방법

Kubernetes에서 GPU 가속화를 지원하는 방법은 복잡할 수 있지만, 아래 단계를 따라하면 쉽게 이해할 수 있습니다. 이 과정은 주로 NVIDIA GPU를 기준으로 설명하며, AMD나 Intel GPU에도 유사하게 적용됩니다.

### 기본 설정
- **디바이스 플러그인 사용**: Kubernetes는 GPU를 클러스터 리소스로 노출하기 위해 디바이스 플러그인을 사용합니다. NVIDIA의 경우 NVIDIA Device Plugin을 설치하면 GPU가 `nvidia.com/gpu`로 등록됩니다. AMD GPU도 비슷한 방식으로 설정 가능합니다.  
- **노드 드라이버 설치**: GPU가 장착된 노드에 해당 벤더의 드라이버를 설치해야 합니다. 예를 들어, NVIDIA GPU라면 NVIDIA 드라이버를 설치합니다.  
- **노드 라벨링**: GPU 노드를 구분하기 위해 라벨을 붙입니다. 수동으로 `kubectl label nodes <node-name> accelerator=nvidia-tesla-t4` 명령어를 사용하거나, Node Feature Discovery(NFD)를 통해 자동으로 라벨링할 수 있습니다.  

### 파드 설정
- 파드가 GPU를 사용하려면 `resources.limits`에 GPU 리소스를 요청해야 합니다. 예를 들어, `nvidia.com/gpu: 1`을 설정하면 해당 파드는 GPU가 있는 노드에서만 실행됩니다.  
- GPU 리소스는 `limits`만 설정 가능하며, `requests`는 `limits`와 동일해야 합니다.  

### 고급 활용
- **GPU 공유**: 단일 GPU를 여러 파드가 공유하려면 Time-Slicing을 사용할 수 있습니다. NVIDIA GPU Operator를 통해 설정하면, 한 GPU를 여러 파드가 시간 분할로 사용할 수 있습니다.  
- **MIG(Multi-Instance GPU)**: NVIDIA Ampere GPU(A100 등)에서 지원되며, 한 GPU를 여러 독립 인스턴스로 분할해 각 파드에 할당할 수 있습니다.  
- **CUDA MPS**: 여러 프로세스가 GPU를 동시에 사용할 수 있게 해주는 기술로, CUDA 11.4 이후 버전에서 리소스 제한 기능이 추가되었습니다.  

### 클라우드 환경
- Google Kubernetes Engine(GKE) 같은 클라우드에서는 GPU 노드 풀을 생성하고, 드라이버를 자동 또는 수동으로 설치할 수 있습니다. 예를 들어, `gcloud container node-pools create` 명령어로 GPU 타입과 개수를 지정할 수 있습니다.  
- 클라우드 제공업체의 문서를 참고해 노드 선택자와 스케줄링 설정을 조정하세요.  

### 추가 도구
- NVIDIA Run:ai는 AI 워크로드에서 GPU 리소스를 동적으로 관리하고 활용률을 높이는 도구입니다. YAML 파일과 kubectl을 사용해 쉽게 설정할 수 있습니다.  

이 방법들은 연구에 따르면 효과적이며, 특정 워크로드에 따라 적합한 기술을 선택하면 됩니다. 더 자세한 내용은 아래 보고서를 참고하세요.

---

## 보고서: Kubernetes 환경에서의 GPU 가속화 지원 기술

이 보고서는 Kubernetes 환경에서 GPU 가속화를 지원하는 방법을 상세히 다루며, 다양한 기술과 설정 방법을 포함합니다. NVIDIA GPU를 중심으로 설명하지만, AMD와 Intel GPU에도 유사하게 적용될 수 있습니다. 모든 정보는 2025년 4월 24일 기준으로 최신 자료를 기반으로 작성되었습니다.

### 1. 배경 및 개요
Kubernetes는 컨테이너화된 애플리케이션을 자동화, 배포, 스케일링하는 오픈소스 플랫폼입니다. GPU는 병렬 처리가 필요한 작업, 특히 머신러닝, 딥러닝, 과학 시뮬레이션에서 가속화를 제공합니다. Kubernetes에서 GPU를 효과적으로 활용하려면 GPU를 클러스터 리소스로 등록하고, 이를 파드가 요청할 수 있도록 설정해야 합니다.

### 2. 주요 기술 및 방법

#### 2.1 디바이스 플러그인
Kubernetes는 디바이스 플러그인을 통해 GPU와 같은 특수 하드웨어를 클러스터에 통합합니다. 이는 GPU를 일반 리소스처럼 관리할 수 있게 해줍니다.
- **NVIDIA GPU**: NVIDIA Device Plugin을 사용하면 GPU가 `nvidia.com/gpu`로 등록됩니다. 설치 후, 파드는 이 리소스를 요청할 수 있습니다. 관련 문서: [Schedule GPUs](https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/).
- **AMD GPU**: AMD GPU Device Plugin을 사용하면 `amd.com/gpu`로 등록됩니다. 벤더별 문서를 참고하세요.
- **설치 요구사항**: GPU가 장착된 노드에 해당 드라이버를 설치하고, 디바이스 플러그인을 배포해야 합니다. NVIDIA의 경우 NVIDIA GPU Operator를 사용하면 관리가 용이합니다.

#### 2.2 노드 구성 및 라벨링
GPU 노드를 구분하기 위해 라벨링이 필요합니다. 이는 파드 스케줄링 시 GPU 노드로 올바르게 배치되도록 합니다.
- **수동 라벨링**: `kubectl label nodes <node-name> accelerator=nvidia-tesla-t4`와 같은 명령어로 노드에 라벨을 붙일 수 있습니다.
- **자동 라벨링**: Node Feature Discovery(NFD)를 사용하면 GPU와 같은 하드웨어 특성을 자동으로 감지하고 라벨링합니다. NFD는 모든 Kubernetes 버전과 호환되며, 벤더별 플러그인을 지원합니다. 관련 문서: [Node Feature Discovery](https://github.com/kubernetes-sigs/node-feature-discovery).

#### 2.3 파드 스케줄링
GPU를 사용하는 파드는 리소스 요청을 통해 GPU를 할당받습니다.
- 예시 YAML:
  ```yaml
  apiVersion: v1
  kind: Pod
  metadata:
    name: gpu-pod
  spec:
    containers:
    - name: gpu-container
      image: <gpu-enabled-image>
      resources:
        limits:
          nvidia.com/gpu: 1
  ```
- Kubernetes는 이 파드를 GPU가 있는 노드로만 스케줄링합니다. GPU 리소스는 `limits`에서만 설정 가능하며, `requests`는 `limits`와 동일해야 합니다.

#### 2.4 GPU 공유 및 활용 최적화
단일 GPU를 여러 파드가 효율적으로 사용할 수 있도록 하는 기술이 있습니다.
- **Time-Slicing**: NVIDIA GPU Operator를 사용하면 단일 GPU를 시간 분할로 여러 파드가 공유할 수 있습니다. 예를 들어, 한 GPU를 5개의 가상 리소스로 설정하면, 각 파드는 `nvidia.com/gpu: 1`을 요청할 수 있습니다. 관련 문서: [Time-Slicing GPUs](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/gpu-sharing.html).
- **Multi-Instance GPU (MIG)**: NVIDIA Ampere 아키텍처 GPU(A100 등)에서 지원되며, 한 GPU를 여러 독립 인스턴스로 분할합니다. 각 인스턴스는 메모리와 컴퓨팅 리소스를 독립적으로 사용 가능합니다. 관련 문서: [MIG Support in Kubernetes](https://docs.nvidia.com/datacenter/cloud-native/kubernetes/mig-k8s.html).
- **CUDA Multi-Process Service (MPS)**: 여러 프로세스가 동시에 GPU를 사용할 수 있게 해주는 기술로, CUDA 11.4 이후 버전에서 리소스 제한 기능이 추가되었습니다. 관련 문서: [Volta MPS Execution Resource Provisioning](https://docs.nvidia.com/deploy/mps/index.html#topic_3_3_5_2).

#### 2.5 클라우드 환경에서의 GPU 사용
클라우드 Kubernetes 서비스(GKE, AWS EKS, Azure AKS 등)에서는 GPU를 사용하기 위한 추가 설정이 필요합니다.
- **GKE에서 GPU 사용**:
  - GPU 노드 풀을 생성합니다. 예를 들어, `gcloud container node-pools create POOL_NAME --accelerator type=nvidia-tesla-t4,count=2,gpu-driver-version=default` 명령어를 사용합니다.
  - 드라이버 설치 방식은 Google이 관리하거나 사용자가 수동으로 할 수 있습니다. 관련 문서: [Run GPUs in GKE](https://cloud.google.com/kubernetes-engine/docs/how-to/gpus).
  - 파드는 `nvidia.com/gpu` 리소스를 요청하고, 노드 선택자를 통해 GPU 노드로 스케줄링됩니다.
- **다른 클라우드**: 각 클라우드 제공업체의 문서를 참고하세요. 예를 들어, AWS EKS에서는 NVIDIA Device Plugin을 사용해 설정합니다.

#### 2.6 추가 도구: NVIDIA Run:ai
NVIDIA Run:ai는 Kubernetes에서 GPU 리소스를 동적으로 스케줄링하고 관리하는 도구입니다. 특히 AI 워크로드에서 GPU 활용률을 최대화하고, 리소스 할당을 최적화하는 데 유용합니다. YAML 파일과 kubectl을 사용해 쉽게 설정 가능하며, 데이터 과학자와 엔지니어 간 협업을 단순화합니다. 관련 문서: [Accelerate AI & Machine Learning Workflows](https://www.nvidia.com/en-us/software/run-ai/).

### 3. 주의사항 및 제한
- GPU 리소스는 `limits`에서만 설정 가능하며, `requests`는 `limits`와 동일해야 합니다. 이는 Kubernetes의 설계로 인해 발생합니다.
- Time-Slicing, MIG와 같은 고급 기능은 NVIDIA GPU에만 지원되며, 하드웨어 요구사항(예: Ampere 아키텍처)이 있습니다.
- 클라우드 환경에서는 GPU 노드 풀을 생성할 때 Compute Engine GPU 쿼터를 확인해야 합니다. 예를 들어, GKE에서는 [쿼터 요청](https://console.cloud.google.com/iam-admin/quotas) 페이지에서 확인 가능합니다.
- GKE에서는 GPU 노드 풀에 GPU를 나중에 추가할 수 없으며, 유지보수 중 라이브 마이그레이션이 지원되지 않습니다.

### 4. 모니터링 및 최적화
- GPU 사용량은 클라우드 모니터링 도구로 확인할 수 있습니다. 예를 들어, GKE에서는 Cloud Monitoring에서 Duty Cycle(`container/accelerator/duty_cycle`), Memory Usage(`container/accelerator/memory_used`)를 확인할 수 있습니다. 관련 문서: [About GPUs in GKE](https://cloud.google.com/kubernetes-engine/docs/concepts/gpus).
- 노드 풀 업그레이드는 릴리스 채널, 유지보수 창, 서지/블루-그린 전략을 통해 수행할 수 있습니다. 관련 문서: [Node Pool Upgrade Strategies](https://kubernetes-engine/docs/concepts/node-pool-upgrade-strategies).

### 5. 사례 연구 및 활용
- BumbleTech는 GPU-powered Kubernetes 클러스터를 통해 ML 워크로드를 스케줄링하고, 실시간 추론을 수행합니다. 관련 문서: [GPU-powered Kubernetes clusters](https://medium.com/bumble-tech/gpu-powered-kubernetes-clusters-7fc6505125c).
- 개인 Kubernetes 환경에서도 Intel GPU 가속화를 설정할 수 있으며, 관련 블로그를 참고하세요: [Intel GPU acceleration on Kubernetes](https://jonathangazeley.com/2025/02/11/intel-gpu-acceleration-on-kubernetes/).

### 6. 표: GPU 공유 기술 비교

| 기술                  | 설명                                                                 | 장점                                      | 단점                                      | 지원 하드웨어       |
|-----------------------|----------------------------------------------------------------------|-------------------------------------------|-------------------------------------------|---------------------|
| Time-Slicing          | 단일 GPU를 시간 분할로 여러 파드가 공유                     | 활용률 증가, 설정 간단                    | 지연 증가, OOM 가능성                     | NVIDIA GPU          |
| MIG (Multi-Instance GPU) | GPU를 여러 독립 인스턴스로 분할, 각 인스턴스 독립 리소스 | 메모리 및 오류 격리, 안정성 높음          | Ampere 아키텍처 필요                     | NVIDIA Ampere (A100)|
| CUDA MPS              | 여러 프로세스가 동시에 GPU 사용, 리소스 제한 지원         | 병렬 처리 효율성, CUDA 11.4+ 지원        | 오류 격리 제한, 메모리 보호 제한          | NVIDIA GPU          |
| vGPU (가상화)         | VM이 GPU에 직접 접근, 라이브 마이그레이션 지원            | VDI/컴퓨트 혼합 가능, 유연성 높음        | 설정 복잡, 하드웨어 요구사항 높음         | NVIDIA GPU          |

### 7. 결론
Kubernetes에서 GPU 가속화를 지원하려면 디바이스 플러그인, 노드 라벨링, 파드 스케줄링을 기본으로 하고, 필요에 따라 Time-Slicing, MIG, CUDA MPS와 같은 고급 기술을 활용하면 됩니다. 클라우드 환경에서는 제공업체의 문서를 참고해 설정하고, AI 워크로드에서는 NVIDIA Run:ai 같은 도구를 고려하세요. 연구는 이러한 방법이 효과적임을 제안하며, 특정 워크로드와 하드웨어에 따라 최적의 설정을 선택해야 합니다.

---

## 주요 인용

- [Schedule GPUs Kubernetes](https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/)
- [Improving GPU Utilization NVIDIA](https://developer.nvidia.com/blog/improving-gpu-utilization-in-kubernetes/)
- [Run GPUs in GKE Google Cloud](https://cloud.google.com/kubernetes-engine/docs/how-to/gpus)
- [Time-Slicing GPUs NVIDIA](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/gpu-sharing.html)
- [MIG Support in Kubernetes NVIDIA](https://docs.nvidia.com/datacenter/cloud-native/kubernetes/mig-k8s.html)
- [Volta MPS Execution Resource Provisioning NVIDIA](https://docs.nvidia.com/deploy/mps/index.html#topic_3_3_5_2)
- [Node Feature Discovery GitHub](https://github.com/kubernetes-sigs/node-feature-discovery)
- [Accelerate AI & Machine Learning Workflows NVIDIA](https://www.nvidia.com/en-us/software/run-ai/)
- [GPU-powered Kubernetes clusters Bumble Tech](https://medium.com/bumble-tech/gpu-powered-kubernetes-clusters-7fc6505125c)
- [Intel GPU acceleration on Kubernetes Jonathan Gazeley](https://jonathangazeley.com/2025/02/11/intel-gpu-acceleration-on-kubernetes/)
- [About GPUs in GKE Google Cloud](https://cloud.google.com/kubernetes-engine/docs/concepts/gpus)


---
layout: post
title: How to Serve PyTorch Models with TorchServe
date: 2022-07-14
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [How to Serve PyTorch Models with TorchServe](https://www.youtube.com/watch?v=XlO7iQMV3Ik)


---

# How to Serve PyTorch Models with TorchServe


## Abstract

### What is new?

- New examples for serving HuggingFace Transformers, MMF: [https://github.com/pytorch/serve/tree/master/examples/MMF-activity-recognition](https://github.com/pytorch/serve/tree/master/examples/MMF-activity-recognition)
- Ensemble model support with examples for Neural Machine Translation
- Model interpretability using Captum.ai - [https://github.com/pytorch/serve/tree/master/examples/Huggingface_Transformers#captum-explanations-for-visual-insights](https://github.com/pytorch/serve/tree/master/examples/Huggingface_Transformers#captum-explanations-for-visual-insights)
- Kubeflow Pipelines support : for open source Kubeflow pipelines and Google Vertex AI (samples [https://github.com/kubeflow/pipelines/tree/master/samples/contrib/pytorch-samples](https://github.com/kubeflow/pipelines/tree/master/samples/contrib/pytorch-samples))
- KFServing integrations with Canary rollouts and auto-scaling (samples [https://github.com/kserve/kserve/tree/master/docs/samples/v1beta1/torchserve](https://github.com/kserve/kserve/tree/master/docs/samples/v1beta1/torchserve)) (blog [https://blog.kubeflow.org/release/official/2021/03/08/kfserving-0.5.html](https://blog.kubeflow.org/release/official/2021/03/08/kfserving-0.5.html))
- MLFlow integrations with examples -- Open source library for MLOps - [https://github.com/mlflow/mlflow-torchserve/tree/master/examples](https://github.com/mlflow/mlflow-torchserve/tree/master/examples)
- [The Kubeflow Blog](https://blog.kubeflow.org/)

### TorchServe on the cloud

- AWS: [https://catalog.us-east-1.prod.workshops.aws/workshops/04eb9f59-6d25-40c5-a828-67df58b85739/](https://catalog.us-east-1.prod.workshops.aws/workshops/04eb9f59-6d25-40c5-a828-67df58b85739/)
- Google Cloud: [https://cloud.google.com/ai-platform/prediction/docs/getting-started-pytorch-container](https://cloud.google.com/ai-platform/prediction/docs/getting-started-pytorch-container)
- Microsoft: [https://techcommunity.microsoft.com/t5/ai-machine-learning-blog/deploy-pytorch-models-with-torchserve-in-azure-machine-learning/ba-p/2466459](https://techcommunity.microsoft.com/t5/ai-machine-learning-blog/deploy-pytorch-models-with-torchserve-in-azure-machine-learning/ba-p/2466459)

### Dynabench and Flores 

- [https://dynabench.org/tasks/3#overall](https://dynabench.org/tasks/3#overall)
- [https://github.com/facebookresearch/dynalab](https://github.com/facebookresearch/dynalab)
- [https://www.statmt.org/wmt21/large-scale-multilingual-translation-task.html](https://www.statmt.org/wmt21/large-scale-multilingual-translation-task.html)
- PyTorch Github repo: [github.com/pytorch/serve](github.com/pytorch/serve)


## Bio

Hamid Shojanazeri is a Partner Engineer at PyTorch, here to demonstrate the basics of using TorchServe. As the preferred model serving solution for PyTorch, TorchServe allows you to expose a web API for your model that may be accessed directly or via your application. With default model handlers that perform basic data transforms, TorchServe can be a very effective tool for those participating in our Hackathon.

<iframe width="600" height="400" src="https://www.youtube.com/embed/XlO7iQMV3Ik" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
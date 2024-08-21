---
layout: post
title: TableDiffusion; Generative AI for private tabular data
date: 2024-08-20
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [TableDiffusion; Generative AI for private tabular data](https://www.youtube.com/watch?v=2QRrGWoXOb4)

---



# TableDiffusion: Generative AI for private tabular data

- View the paper on arXiv: [https://arxiv.org/abs/2308.14784](https://arxiv.org/abs/2308.14784)
- View the code on Github: [https://github.com/gianlucatruda/TableDiffusion](https://github.com/gianlucatruda/TableDiffusion)
- Presentation supporting the paper "Generating tabular datasets under differential privacy." arXiv preprint arXiv:2308.14784 (2023) by Gianluca Truda. Originally recorded August 2023 for thesis defence.

## Abstract

Machine Learning (ML) is accelerating progress across fields and industries, but relies on accessible and high-quality training data. Some of the most important datasets are found in biomedical and financial domains in the form of spreadsheets and relational databases. But this tabular data is often sensitive in nature. Synthetic data generation offers the potential to unlock sensitive data, but generative models tend to memorise and regurgitate training data, which undermines the privacy goal. To remedy this, researchers have incorporated the mathematical framework of Differential Privacy (DP) into the training process of deep neural networks. But this creates a trade-off between the quality and privacy of the resulting data. Generative Adversarial Networks (GANs) are the dominant paradigm for synthesising tabular data under DP, but suffer from unstable adversarial training and mode collapse, which are exacerbated by the privacy constraints and challenging tabular data modality. This work optimises the quality-privacy trade-off of generative models, producing higher quality tabular datasets with the same privacy guarantees. We implement novel end-to-end models that leverage attention mechanisms to learn reversible tabular representations. We also introduce TableDiffusion, the first differentially-private diffusion model for tabular data synthesis. Our experiments show that TableDiffusion produces higher-fidelity synthetic datasets, avoids the mode collapse problem, and achieves state-of-the-art performance on privatised tabular data synthesis. By implementing TableDiffusion to predict the added noise, we enabled it to bypass the challenges of reconstructing mixed-type tabular data. Overall, the diffusion paradigm proves vastly more data and privacy efficient than the adversarial paradigm, due to augmented re-use of each data batch and a smoother iterative training process.


<iframe width="600" height="400" src="https://www.youtube.com/embed/2QRrGWoXOb4?si=URAA-1G37ILX3QAS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>



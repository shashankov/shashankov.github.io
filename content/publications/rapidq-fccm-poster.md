---
title: "Lightweight Queueing Abstraction for Rapid Simulation and Automated Tuning of Input-Dependent Streaming Pipelines on FPGAs"
date: 2026-05-15
authors: ["Shashank Obla", "Bin Li", "James C. Hoe"]
description: "Poster, FCCM 2026"
pdf: "uploads/publications/RapidQ_FCCM_2026__1_Page_.pdf"
poster: "uploads/publications/RapidQ_FCCM_Poster.pdf"
---

The programmability of FPGAs enables designs to be tuned to specific deployment and use-cases. This capability is critical for input-dependent streaming pipelines, whose optimal configuration varies not only across resource limits and performance targets, but also with the data being processed. However, existing methods fail to scale for large, real-world designs with long workloads. To address this challenge, we propose RapidQ, a performance model that allows designers to capture the dataflow of their streaming pipeline as a queueing system, enabling fast case-by-case re-tuning for resource efficiency. Unburdened by the functional details of the design, a trace model drives a fast queueing simulation that can predict the performance of the pipeline across various buffer sizes and module throughput configurations without repeating full functional simulations. Our simulator is over 7x faster than the state-of-the-art and yields up to 42% resource savings for real-world workloads.

---
title: "RapidQ: Queueing-based Performance Modeling Framework for Rapid Simulation and Automated Tuning of Input-Dependent Streaming FPGA Pipelines"
date: 2026-09-27
authors: ["Shashank Obla", "James C. Hoe", "Bin Li"]
description: "IEEE International Symposium on Workload Characterization (IISWC 2026) — To appear"
selected: true
---

The programmability of Field-Programmable Gate Arrays (FPGAs) enables hardware to be tuned for specific deployments and use-cases. This flexibility is critical for input-dependent streaming pipelines, whose optimal configuration varies not only across resource limits and performance targets, but also with the workload being processed. Since static analysis cannot accurately estimate the performance of such pipelines, designers rely on runtime or simulation-based approaches to drive design-space exploration. However, these methods fail to scale for large, real-world designs with long workloads. The vast search space of co-tuning buffer sizes and kernel throughputs, both critical to resource efficiency, hampers adoption of FPGAs for this class of applications.

We propose RapidQ, a performance model and workflow that allows FPGA accelerator designers to capture the dataflow of their streaming pipeline as a lightweight queueing system, enabling fast case-by-case deployment-time re-tuning for resource efficiency. By performing a one-shot functional simulation of the design implemented via High-Level Synthesis (HLS), the input trace is distilled into a lightweight workload model. Unburdened by the underlying functional details, this trace model drives a fast queueing simulation that estimates performance across various buffer sizes and module throughput configurations without the need to repeat full functional simulations. Our simulator achieves over a 7x speedup compared to state-of-the-art tools and is over 100x faster than RTL simulation, all while maintaining sufficient accuracy for reliable exploration. By co-tuning buffer sizes and module throughputs, the RapidQ tuning flow yields up to 42% resource savings for real-world workloads compared to tuning each in isolation.

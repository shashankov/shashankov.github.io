---
title: Bio
description: About Shashank Obla — research interests, work experience, and hobbies
---

I am a computer architecture researcher with comprehensive cross-stack experience, from custom digital tapeouts to datacenter-scale stochastic modeling and machine learning. My work specializes in the design and optimization of heterogeneous reconfigurable systems across networking, security, and database analytics workloads.

## Current Research at CMU

I am currently a Ph.D. Candidate in the Electrical and Computer Engineering department at Carnegie Mellon University, advised by Prof. James Hoe. My thesis focuses on the **Design and Optimization of Input-Dependent Streaming Pipelines on FPGAs**.

My major research projects include:

- **RapidQ**: Designed an abstraction and modeling framework for input-dependent streaming pipelines on FPGAs. By extracting models directly from HLS implementations with >97% accuracy, I engineered a queueing-based SystemC simulator that achieves >7x speedup over state-of-the-art tools. This powers an automated tuning flow that reduces resource utilization by over 40% across synthetic and real-world workloads.
- **RapidDetect**: Developed a heterogeneous FPGA-CPU pipeline for streaming log monitoring using Sigma rules at over 200Gbps. This involved implementing a highly-parametrizable string matching engine in HLS and integrating it with Hyperscan on the CPU, achieving a 100x reduction in threat detection latency.
- **Group-by Aggregation Accelerator**: Architected a streaming group-by aggregation pipeline capable of processing over 64GBps on a single FPGA, featuring a fully-associative pre-aggregator and an open-sourced parametrizable Network-on-Chip (NoC).

## Industry Experience

In Summer 2020, I interned at **Intel Corporation** in the Programmable Solutions Group. During this time, I modeled Partial Reconfiguration (PR) flows for next-generation FPGAs using SystemC, aiming to achieve sub-millisecond reconfiguration times. I also collaborated with cross-functional circuit design teams to analyze the full-stack implications of novel PR features.

## Past Experience

Before coming to CMU, I completed my B.Tech and M.Tech in Electrical Engineering at **IIT Bombay**, where I was awarded the Institute Gold Medal. As part of my Master's Thesis under [Prof. Sachin Patkar](https://www.ee.iitb.ac.in/wiki/faculty/patkar), I worked on Accelerated Circuit Simulation, with the goal of implementing it on a host-accelerator system like an FPGA or GPU.

During my undergrad, I interned at the University of Tokyo in the HPC Lab under [Prof. Reiji Suda](http://olab.is.s.u-tokyo.ac.jp/~reiji/), working with GPU acceleration (CUDA), multi-processor programming (openMP), and distributed computing (MPI). I was also heavily involved with the [IIT Bombay Racing](https://www.iitbracing.org/) team, developing the first CAN network for the team's electric racecars and implementing wireless telemetry.

## Miscellaneous

On a lighter note, in my spare time I enjoy watching TV Series (Star Trek, F.R.I.E.N.D.S., The Big Bang Theory, and Doctor Who are a few of my favorites), reading fiction (Agatha Christie's Poirot series, Sherlock Holmes, Harry Potter, Bartimaeus Trilogy...), and most importantly [Pokémon](https://www.pokemon.com)[^1]: I own a proud collection of all the RPG games (at least one of each generation)! Also, as I really enjoyed my visit to Japan and their culture, I learned Japanese during my last two years at IIT Bombay.

[^1]: Noticed the favicon?

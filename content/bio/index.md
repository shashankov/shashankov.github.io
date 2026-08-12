---
title: Bio
description: About me — research interests, work experience, and hobbies
---

I am a computer architecture researcher with comprehensive cross-stack experience, from custom digital tapeouts to datacenter-scale stochastic modeling and machine learning. My work specializes in the design and optimization of heterogeneous reconfigurable systems across networking, security, and database analytics workloads.

## Education

<div style="display: grid; grid-template-columns: 92px 1fr; gap: 12px; align-items: start; margin-bottom: 1.5rem;">
    <div>
        <img src="../uploads/cmu_logo.png" alt="Carnegie Mellon University" style="width: 80px; height: 80px; display: block; object-fit: contain;">
    </div>
    <div style="width: 100%;">
        <div style="display: flex; justify-content: space-between; align-items: start; width: 100%;">
            <strong style="font-size: 1.15rem;">Carnegie Mellon University</strong>
            <span style="font-size: 0.95rem; font-style: italic; color: #6c757d; white-space: nowrap; margin-left: 15px; margin-top: 2px;">2019 - 2026</span>
        </div>
        <div style="font-size: 1.0rem; margin-top: 2px;">Ph.D., Electrical and Computer Engineering (GPA: 3.97/4.0)</div>
        <div style="font-size: 0.95rem; color: #6c757d; margin-top: 2px;">Thesis: Accelerating Input-Dependent Streaming Applications on FPGAs &middot; Advisor: Prof. James Hoe</div>
        <div style="font-size: 0.95rem; color: #6c757d; margin-top: 2px;"><i class="fas fa-award text-warning"></i> Dean’s Fellowship</div>
    </div>
</div>

<div style="display: grid; grid-template-columns: 92px 1fr; gap: 12px; align-items: start; margin-bottom: 1.5rem;">
    <div>
        <img src="../uploads/iitb_logo.png" alt="Indian Institute of Technology, Bombay" style="width: 80px; height: 80px; display: block; object-fit: contain; background-color: #ffffff;">
    </div>
    <div style="width: 100%;">
        <div style="display: flex; justify-content: space-between; align-items: start; width: 100%;">
            <strong style="font-size: 1.15rem;">Indian Institute of Technology, Bombay</strong>
            <span style="font-size: 0.95rem; font-style: italic; color: #6c757d; white-space: nowrap; margin-left: 15px; margin-top: 2px;">2014 - 2019</span>
        </div>
        <div style="font-size: 1.0rem; margin-top: 2px;">B.Tech and M.Tech, Electrical Engineering (GPA: 9.84/10.0)</div>
        <div style="font-size: 0.95rem; color: #6c757d; margin-top: 2px;">Thesis: Accelerated Circuit Simulation &middot; Advisor: Prof. Sachin Patkar</div>
        <div style="font-size: 0.95rem; color: #6c757d; margin-top: 2px;"><i class="fas fa-award text-warning"></i> <a href="https://www.iitb.ac.in/story/57th-convocation#:~:text=Institute%20Gold%20Medal%20(2017-18)%E2%80%99%20was%20awarded%20to%20Shashank%20Vijayakumar%20Obla" target="_blank" rel="noopener noreferrer" style="color: inherit; text-decoration: underline; text-underline-offset: 3px;">Institute Gold Medal</a></div>
    </div>
</div>

## Current Research at CMU

I received my Ph.D. from the Electrical and Computer Engineering Department at Carnegie Mellon University, advised by Prof. James Hoe. My thesis focused on **Accelerating Input-Dependent Streaming Applications on FPGAs**.

My major research projects include:

- **RapidQ**: Designed an abstraction and performance modeling framework for input-dependent streaming pipelines on FPGAs. By extracting models directly from HLS implementations with >97% accuracy, I built a queueing-based SystemC simulator that achieves >7x speedup over state-of-the-art tools. This powers an automated tuning flow that reduces resource utilization by over 40% across synthetic and real-world workloads.
- **RapidDetect**: Developed a heterogeneous FPGA-CPU pipeline for streaming log monitoring using Sigma rules at over 200Gbps. This involved implementing a highly parameterizable string-matching engine in HLS and integrating it with Hyperscan on the CPU, achieving a 100x reduction in threat detection latency while being over 4x cheaper than a streaming Hyperscan deployment.
- **Group-by Aggregation Accelerator**: Architected a streaming group-by aggregation pipeline capable of processing over 64GBps on a single FPGA, featuring a fully-associative pre-aggregator and an open-source parameterizable Network-on-Chip (NoC).

## Industry Experience

In the summer of 2020, I interned at **Intel Corporation** in the Programmable Solutions Group working with [Scott Weber](https://www.linkedin.com/in/scott-weber-7881493/). During this time, I modeled Partial Reconfiguration (PR) flows for next-generation FPGAs using SystemC, aiming to achieve sub-millisecond reconfiguration times. I also collaborated with cross-functional circuit design teams to analyze the full-stack implications of novel PR features.

## Past Experience

Before coming to CMU, I completed my B.Tech and M.Tech in Electrical Engineering at **IIT Bombay**, where I was awarded the Institute Gold Medal. As part of my Master's Thesis under [Prof. Sachin Patkar](https://www.ee.iitb.ac.in/wiki/faculty/patkar), I worked on Accelerated Circuit Simulation, with the goal of implementing it on a host-accelerator system like an FPGA or GPU.

During my undergrad, I interned at the University of Tokyo in the HPC Lab under [Prof. Reiji Suda](http://olab.is.s.u-tokyo.ac.jp/~reiji/), working on GPU acceleration (CUDA), multi-processor programming (OpenMP), and distributed computing (MPI). I was also involved with the [IIT Bombay Racing](https://www.iitbracing.org/) team, developing the first CAN network for the team's electric racecars and implementing wireless telemetry.

## Miscellaneous

On a lighter note, in my spare time I enjoy watching TV series (Star Trek, F.R.I.E.N.D.S., The Big Bang Theory, and Doctor Who are a few of my favorites), reading fiction (Agatha Christie's Poirot series, Sherlock Holmes, Harry Potter, Bartimaeus Trilogy...), and most importantly [Pokémon](https://www.pokemon.com)[^1]: I own a proud collection of all the RPG games (at least one of each generation)! Also, as I really enjoyed my visit to Japan and their culture, I learned Japanese during my last two years at IIT Bombay.

[^1]: Noticed the favicon?
